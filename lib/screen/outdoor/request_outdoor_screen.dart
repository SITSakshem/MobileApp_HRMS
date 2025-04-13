import 'package:flutter/material.dart';
import 'package:hrms/common/app_extensions.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/repository/outdoor_repository.dart';
import 'package:hrms/screen/attendance/attendance_screen.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';
import '../../common/hexColor.dart';
import '../../common/navigate_page.dart';
import '../../data/model/base_response.dart';
import '../../data/remote/result.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';

class RequestOutdoorScreen extends StatefulWidget {
  const RequestOutdoorScreen({super.key});

  @override
  State<RequestOutdoorScreen> createState() => _RequestOutdoorState();
}

class _RequestOutdoorState extends State<RequestOutdoorScreen> {
  late UserData userData;
  DateTime now = DateTime.now();
  DateTime fromDateDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8);
  DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
  DateFormat timeFormatter = DateFormat('HH:mm');
  late String fromDate = dateFormatter.format(now);
  late String inTime = timeFormatter.format(now);
  late String outTime = timeFormatter.format(now);

  TextEditingController remark = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isInTimeEntry = false;

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Outdoor'),
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
              const FormThemedText('Date'),
              InkWell(
                onTap: () {
                  /**
                   *
                   * open date picker
                   */
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(now.year), lastDate: DateTime(now.year + 1))
                      .then((value) {
                    setState(() {
                      fromDateDate = value ?? DateTime.now();
                      fromDate = dateFormatter.format(fromDateDate);
                    });
                  });
                },
                child: RoundedBox(
                    height: 42,
                    child: Row(
                      children: [ThemedText(text: fromDate.toString()), const Spacer(), const Icon(Icons.calendar_today)],
                    )),
              ),

              hSpacer(12),
              const FormThemedText('In Time'),
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
                    const FormThemedText('Out Time'),
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
              Visibility(
                visible: isLoading,
                replacement: InkWell(
                  onTap: () {
                    submitGeoAttendance();
                  },
                  child: RoundedContainer(
                      height: 38,
                      containerBGColor: HexColor('#72A8D4'),
                      child: const Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                child: const Center(child: CircularProgressIndicator()),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitGeoAttendance() async {
    setState(() {
      isLoading = true;
    });

    var result = await OutdoorRepository().postOutdoorApplication(userData, inTime, outTime, fromDate, remark.text);

    setState(() {
      isLoading = false;
    });

    if (result is Success) {
      var response = (result.data as BaseResponse);
      String title = "Failure";
      String message = response.message;
      if (response.isSuccess()) {
        title = "Success";
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    //goToPushReplacePage(context, const AttendanceScreen());
                  },
                ),
              ],
            );
          });
    }

    setState(() {
      isLoading = false;
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
}
