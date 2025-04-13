import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrms/common/app_extensions.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/screen/attendance/attendance_screen.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../common/hexColor.dart';
import '../../common/navigate_page.dart';
import '../../data/local/user_data.dart';
import '../../data/model/attendance_application_response.dart';
import '../../data/model/base_response.dart';
import '../../data/remote/result.dart';
import '../../data/repository/attendance_repository.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';

class RegularizedAttendanceNew extends StatefulWidget {
  const RegularizedAttendanceNew({super.key});

  @override
  State<RegularizedAttendanceNew> createState() => _RegularizedAttendanceNew();
}

class _RegularizedAttendanceNew extends State<RegularizedAttendanceNew> {
  late UserData userData;
  DateTime now = DateTime.now();
  DateTime fromDateDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8);
  DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
  DateFormat timeFormatter = DateFormat('HH:mm');
  late String fromDate = dateFormatter.format(now);
  late String inTime = timeFormatter.format(now);
  late String outTime = timeFormatter.format(now);
  final ImagePicker _picker = ImagePicker();
  TextEditingController remark = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String oldInTime= "";
  String oldOutTime= "";

  bool isInTimeEntry = false;
  bool showSubmitButton = true;
  XFile? file;
  Position? _currentPosition;
  String latLong = "";

  bool isSubmitPressed = false;
  bool dataLoading = false;
  List<AttendanceApplication> applicationList = [];

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    super.initState();

  }
  
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
          setState(() {
            _currentPosition = position;
            latLong = "${position.latitude},${position.longitude}";
          });
      //_getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _onImageButtonPressed(ImageSource source, BuildContext context) async {
    if (context.mounted) {
      try {
        final List<XFile> pickedFileList = <XFile>[];
        final XFile? media = await _picker.pickImage(source: source);
        if (media != null) {
          pickedFileList.add(media);
          setState(() {
            file = media;
          });
        }
      } catch (e) {
        setState(() {
          //_pickImageError = e;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regularized Attendance'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Employee ID & Name'),
              hSpacer(6),
              EmployeeNameWidget("${userData.empCode} - ${userData.empName}"),
              hSpacer(12),
              const FormThemedText('Regularized Date'),
            InkWell(
                onTap: () {
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(now.year), lastDate: DateTime(now.year + 1))
                      .then((value) {
                    setState(() {
                      fromDate = dateFormatter.format(value ?? DateTime.now());
                      checkAttendanceReport(fromDate, fromDate);
                    });
                  });
                },
                child: RoundedBox(
                    height: 42,
                    child: Row(
                      children: [ThemedText(text: fromDate), const Spacer(), const Icon(Icons.calendar_today)],
                    )),
              ),

              hSpacer(16),
              FormThemedText("Old In-Time - $oldInTime"),
              hSpacer(16),
              FormThemedText("Old Out-Time - $oldOutTime"),
              hSpacer(16),
              const FormThemedText('New - Punch In Time'),
              InkWell(
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                    setState(() {
                      if(value != null) {
                        isInTimeEntry = false;
                        inTime = value.getFormattedTime();
                      }
                    });
                  });
                },
                child: RoundedBox(
                    height: 42,
                    child: Row(
                      children: [ThemedText(text: inTime), const Spacer(), const Icon(Icons.access_time)],
                    )),
              ),
              Visibility(
                visible: !isInTimeEntry,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    hSpacer(12),
                    const FormThemedText('New - Punch Out Time'),
                    InkWell(
                      onTap: () {
                        showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                          setState(() {
                            if(value != null) {
                              outTime = value.getFormattedTime();
                            }
                          });
                        });
                      },
                      child: RoundedBox(
                          height: 42,
                          child: Row(
                            children: [ThemedText(text: outTime), const Spacer(), const Icon(Icons.access_time)],
                          )),
                    ),
                    hSpacer(12),
                  ],
                ),
              ),

              TextFormField(
                maxLines: 3,
                controller: remark,
                autofocus: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Reason',
                  labelStyle: TextStyle(color: HexColor('#72A8D4')),
                ),
              ),
              hSpacer(12),
              hSpacer(12),
              Visibility(
                visible: showSubmitButton,
                replacement: const Center(child: CircularProgressIndicator()),
                child: MyButton(
                    onPressed: () {
                      submitGeoAttendance();
                    },
                    text: "Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitGeoAttendance() async {
  /*  if(file == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('File require')));
      return;
    }*/

    /*if(latLong == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('location require')));
      return;
    }*/

    setState(() {
      showSubmitButton = false;
    });

    //File captureFile = File(file?.path ?? "");
    bool isSuccess = false;
    var result = await AttendanceRepository().attendanceApplication(userData, inTime, outTime, fromDate, remark.text, "captureFile", latLong);
    if (result is Success) {
      var response = (result.data as BaseResponse);
      String message = response.message;
      isSuccess = response.isSuccess();

      showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(isSuccess ? "Success" : "Failure"),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if(isSuccess) {
                      goToPushReplacePage(context, const AttendanceScreen());
                    }
                  },
                ),
              ],
            );
          });
    }

    setState(() {
      showSubmitButton = true;
    });
  }

  void showAlertDialog(BuildContext context, String s) {
    /**
     * show alert to enable location
     */
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(s),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  /**
                   * close dialog and close screen
                   */

                  Navigator.of(context).pop();
                  goToPushReplacePage(context, const AttendanceScreen());
                  //goToPage(context, AttendanceScreen());
                },
              ),
            ],
          );
        });
  }

  void checkAttendanceReport(String fromDate, String toDate) async {
    setState(() {
      dataLoading = true;
      isSubmitPressed = true;
      applicationList.clear();
    });
    var result = await AttendanceRepository().getAttendanceApplication(userData, fromDate, toDate, true, userData.empId);
    if (result is Success) {
      applicationList = result.data as List<AttendanceApplication>;
      var currentData = applicationList[0];
      oldInTime = currentData.inTime;
      oldOutTime = currentData.outTime;
    }
    setState(() {
      dataLoading = false;
    });
  }
}
