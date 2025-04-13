import 'package:flutter/material.dart';
import 'package:hrms/common/app_extensions.dart';
import 'package:hrms/common/hexColor.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/available_comp_off_response.dart';
import 'package:hrms/data/model/base_response.dart';
import 'package:hrms/data/remote/result.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';

import '../../data/repository/comp_off_repository.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';

class CompOffRequestScreen extends StatefulWidget {
  const CompOffRequestScreen({super.key});

  @override
  State<CompOffRequestScreen> createState() => _CompOffRequestScreenState();
}

class _CompOffRequestScreenState extends State<CompOffRequestScreen> {
  late UserData userData;
  DateTime now = DateTime.now();
  DateTime fromDateDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8);
  DateFormat timeFormatter = DateFormat('HH:mm');
  String fromDate = "";
  late String inTime = "";
  late String outTime = "";

  AvailableCompOff? selectedDate;
  TextEditingController remark = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isInTimeEntry = false;
  bool dataLoading = false;
  List<AvailableCompOff> compOffList = [];

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    getDetails();
    super.initState();
  }

  getDetails() async {
    setState(() {
      dataLoading = true;
    });

    var result = await CompOffRepository().getEmployeeCompOff(userData);
    if (result is Success) {
      compOffList = result.data as List<AvailableCompOff>;
      selectedDate = compOffList.firstOrNull;
    }

    setState(() {
      dataLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Row(children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            vSpacer(),
            const Text('CompOff Request'),
          ])),
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
                  hSpacer(18),
                  if(compOffList.isEmpty) const Center(child: Text("Compoff not available for you!!")),
                  hSpacer(18),
                  const FormThemedText('Date'),
                  RoundedBox(
                    height: 52,
                    marginTop: 0,
                    marginBottom: 0,
                    child: DropdownButton<AvailableCompOff>(
                      isExpanded: true,
                      value: selectedDate,
                      items: compOffList.map((AvailableCompOff value) {
                        return DropdownMenuItem<AvailableCompOff>(
                          value: value,
                          child: ThemedText(text: value.attendanceDt.toDateString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDate = value;
                          if(value != null) {
                            inTime = value.inTime;
                            outTime = value.outTime;
                            fromDate = value.attendanceDt.toDateString();
                          }
                        });
                      },
                    ),
                  ),
                  hSpacer(12),
                  const FormThemedText('In Time'),
                  InkWell(
                    onTap: () {
                      showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                        setState(() {
                          if (value != null) {
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
                                if (value != null) {
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
                    visible: dataLoading,
                    replacement: InkWell(
                      onTap: () {
                        submit();
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
          )),
    );
  }

  void submit() async {
    setState(() {
      dataLoading = true;
    });

    var result = await CompOffRepository().applyCompOff(userData, inTime, outTime, fromDate, remark.text);
    setState(() {
      dataLoading = false;
    });

    if (result is Success) {
      var response = (result.data as BaseResponse);
      String title = "Failure";
      String message = response.message;
      if (response.isSuccess()) {
        title = "Success";
      }
      /**
       * show alertdialog for confirmation
       */
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
                  },
                ),
              ],
            );
          });
    } else {
      /**
       * show alertdialog for confirmation
       */
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Something went wrong\nPlease try again later'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
