import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hrms/common/constants.dart';
import 'package:hrms/common/date_extensions.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/punch_type.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/hexColor.dart';
import '../../common/navigate_page.dart';
import '../../data/model/base_response.dart';
import '../../data/remote/result.dart';
import '../../data/repository/attendance_repository.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';

class MobilePunchScreen extends StatefulWidget {
  const MobilePunchScreen({super.key});

  @override
  State<MobilePunchScreen> createState() => _MobilePunchScreenState();
}

class _MobilePunchScreenState extends State<MobilePunchScreen> {
  late UserData userData;
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();

  List<PunchType> punchTypeList = getPunchTypes();
  TextEditingController description = TextEditingController();
  Position? currentPosition;
  late PunchType selectedType = punchTypeList.first;
  String time = DateTime.now().toDateString(format: "dd-MMM-yyyy hh:mm a");
  bool showSubmitButton = true;
  XFile? file;
  String latLong = "";
  String addressFromLatLng = "";
  GoogleMapController? _controller;
  final Set<Marker> _marker = {};

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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) async {
      LatLng latLng = LatLng(position.latitude, position.longitude);
      CameraPosition currentLocation = CameraPosition(target: latLng, zoom: 15);
      _controller?.animateCamera(CameraUpdate.newCameraPosition(currentLocation));
      setState(() {
        currentPosition = position;
        _marker.add(Marker(markerId: const MarkerId("Location"), position: latLng));
        latLong = "${position.latitude},${position.longitude}";
        _getAddressFromLatLng(currentPosition!);
      });

    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];

      setState(() {
        currentPosition = position;
        addressFromLatLng = "${place.name},${place.street},${place.subLocality}, ${place.locality},${place.country}, ${place.postalCode}";
      });

    }).catchError((e) {
      debugPrint(e);
    });
  }


  Future<void> _onImageButtonPressed(ImageSource source, BuildContext context) async {
    if (context.mounted) {
      try {
        final List<XFile> pickedFileList = <XFile>[];
        // can apply maxHeight, maxWidth
        final XFile? media = await _picker.pickImage(source: source, imageQuality: 25);
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

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Punch'),
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
              SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: GoogleMap(
                      initialCameraPosition: _kGooglePlex,
                      markers: _marker.toSet(),
                      onMapCreated: (GoogleMapController controller) {
                        _controller = controller;
                        _getCurrentPosition();
                      }),
                ),
              ),
              hSpacer(12),
              const FormThemedText('Address'),
              hSpacer(12),
              FormThemedText(addressFromLatLng),
              hSpacer(12),
              const FormThemedText('Punch Type'),
              RoundedBox(
                height: 52,
                marginTop: 0,
                marginBottom: 0,
                child: DropdownButton<PunchType>(
                  isExpanded: true,
                  value: selectedType,
                  items: punchTypeList.map((PunchType value) {
                    return DropdownMenuItem<PunchType>(
                      value: value,
                      child: ThemedText(text: value.value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        selectedType = value;
                      }
                    });
                  },
                ),
              ),
              hSpacer(12),
              const FormThemedText('Punch In Time'),
              RoundedBox(
                  height: 42,
                  child: Row(
                    children: [ThemedText(text: time), const Spacer(), const Icon(Icons.access_time)],
                  )),
              hSpacer(12),
              TextFormField(
                maxLines: 3,
                controller: description,
                autofocus: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Description',
                  labelStyle: TextStyle(color: HexColor('#72A8D4')),
                ),
              ),
              hSpacer(12),
              InkWell(
                onTap: () {
                  _onImageButtonPressed(ImageSource.camera, context);
                },
                child: RoundedBox(
                    height: 42,
                    child: const Row(
                      children: [ThemedText(text: "Capture image"), Spacer(), Icon(Icons.camera)],
                    )),
              ),
              hSpacer(12),
              Visibility(
                  visible: file != null,
                  child: Center(
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: Image.file(File(file?.path ?? ""), width: 100, height: 100, fit: BoxFit.contain)),
                  )),
              hSpacer(12),
              Visibility(
                visible: showSubmitButton,
                replacement: const Center(child: CircularProgressIndicator()),
                child: MyButton(
                    onPressed: () {
                      submitGeoAttendance();
                    },
                    text: "Mark ${selectedType.value}"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitGeoAttendance() async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('File require')));
      return;
    }

    if (currentPosition == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('location require')));
      return;
    }

    setState(() {
      showSubmitButton = false;
    });
    //double latitude = 28.62798788932732 ;
    //double longitude = 77.07369260887559;
    File captureFile = File(file?.path ?? "");
    var result = await AttendanceRepository().mobilePunch(
        userData, selectedType.id, time, currentPosition?.latitude ?? 0.0, currentPosition?.longitude ?? 0.0, captureFile, description.text, addressFromLatLng);

    if (result is Success) {
      var response = (result.data as BaseResponse);
      String title = "Failure";
      String message = response.message;
      if (response.isSuccess()) {
        title = "Success";
      }

      showAlertDialog(context, title, message, () {
        Navigator.of(context).pop();
        if (response.isSuccess()) {
          goToDashboard(context);
        }
      });
    }

    setState(() {
      showSubmitButton = true;
    });
  }

  void showAlertDialog(BuildContext context, String title, String message, Function()? clickListener) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: clickListener,
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
