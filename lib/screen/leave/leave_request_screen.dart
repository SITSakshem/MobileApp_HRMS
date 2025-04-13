import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hrms/common/hexColor.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/base_response.dart';
import 'package:hrms/data/model/leave_balance.dart';
import 'package:hrms/data/model/leave_type_response.dart';
import 'package:hrms/data/remote/result.dart';
import 'package:hrms/data/repository/leave_repository.dart';
import 'package:intl/intl.dart';

import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';
import '../../ui_values/text_styles_ui.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  late UserData userData;
  DataResponse? leaveData;
  LeaveType? leaveType;
  ApplicabilityType? applicabilityType;
  TextEditingController remark = TextEditingController();
  bool isSubmit = false;
  DateTime now = DateTime.now();
  DateTime fromDateDate = DateTime.now();
  DateTime toDateDate = DateTime.now();
  DateFormat dt = DateFormat('dd-MMM-yyyy');
  late String fromDate = dt.format(now);
  late String toDate = dt.format(now);
  final formKey = GlobalKey<FormState>();
  bool dataLoading = false;
  List<LeaveBalance> leaveList = [];

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    fromDate = dt.format(now);
    toDate = fromDate;
    getDetails();
    super.initState();
  }

  getDetails() async {
    setState(() {
      dataLoading = true;
    });

    var result = await LeaveRepository().getLeaveType(userData);
    if (result is Success) {
      leaveData = result.data as DataResponse;
      leaveType = leaveData?.leaveType.firstOrNull;
      applicabilityType = leaveData?.applicabilityType.firstOrNull;
    } else {
      leaveData = DataResponse(leaveType: [], applicabilityType: [], dayPart: []);
    }

    Result response = await LeaveRepository().getLeaveBalance(userData);
    if (response is Success) {
      leaveList = response.data as List<LeaveBalance>;
    } else {
      leaveList = [];
    }

    setState(() {
      dataLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    /**
     * fetch today date to show only dd-mm-yyyy
     */
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                title: Row(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  vSpacer(6),
                  const Text('Leave Request'),

                ]),
                /*bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Personal'.toUpperCase(),
                        style: numberTextStyle.copyWith(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Organization'.toUpperCase(),
                        style: numberTextStyle.copyWith(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'CTC',
                        style: numberTextStyle.copyWith(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                )*/),
            body: TabBarView(
              children: [
                widgetLeaveRequest(),
                const Text('Test'),
                const Text('Dev')
                // widgetAttendance(),
                // widgetLeave(),
              ],
            )),
      ),
    );
  }

  Widget widgetLeaveRequest() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormThemedText('From Date'),
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
                      fromDate = dt.format(fromDateDate);
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

              const FormThemedText('To Date'),
              InkWell(
                onTap: () {
                  /**
                   * open date picker
                   */
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: fromDateDate, lastDate: DateTime(now.year + 1))
                      .then((value) {
                    setState(() {
                      toDateDate = value ?? DateTime.now();
                      toDate = dt.format(toDateDate);
                    });
                  });
                },
                child: RoundedBox(
                    height: 42,
                    child: Row(
                      children: [ThemedText(text: toDate.toString()), const Spacer(), const Icon(Icons.calendar_today)],
                    )),
              ),
              hSpacer(12),
              const FormThemedText('Leave type'),
              RoundedBox(
                height: 52,
                marginTop: 0,
                marginBottom: 0,
                child: DropdownButton<LeaveType>(
                  isExpanded: true,
                  value: leaveType,
                  items: leaveData?.leaveType.map((LeaveType value) {
                    return DropdownMenuItem<LeaveType>(
                      value: value,
                      child: ThemedText(text: value.leaveTypeName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      leaveType = value;
                    });
                  },
                ),
              ),
              hSpacer(12),

              const FormThemedText('Leave applicable for'),
              RoundedBox(
                height: 52,
                marginTop: 0,
                marginBottom: 0,
                child: DropdownButton<ApplicabilityType>(
                  isExpanded: true,
                  value: applicabilityType,
                  items: leaveData?.applicabilityType.map((ApplicabilityType value) {
                    return DropdownMenuItem<ApplicabilityType>(
                      value: value,
                      child: ThemedText(text: value.applicabilityTypeName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      applicabilityType = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextFormField(
                maxLines: 3,
                controller: remark,
                autofocus: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value.isBlank == true) {
                    return 'Please enter reason';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Reason',
                  labelStyle: TextStyle(color: HexColor('#72A8D4')),
                ),
              ),
              hSpacer(12),
              isSubmit
                  ? const Center(child: CircularProgressIndicator())
                  : InkWell(
                      onTap: () {
                        if (toDateDate.isBefore(fromDateDate)) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('To date must be greater than From date')));
                          return;
                        }
                        if (formKey.currentState?.validate() == true) {
                          leaveRequest();
                        }
                      },
                      child: RoundedContainer(
                          containerBGColor: HexColor('#72A8D4'),
                          child: const Center(
                              child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ))),
                    ),

              hSpacer(),
              const Divider(color: Colors.grey),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Leave Balance',
                        style: numberTextStyle.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    dataLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                            height: 154,
                            child: Column(
                              children: [
                                Container(
                                  child: rowDataWithSno(context, 'S. No.', 'Name', 'Available'),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: HexColor('#72A8D4'),
                                  ),
                                ),
                                hSpacer(6),
                                Expanded(
                                  child: ListView.separated(
                                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                                    itemCount: leaveList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      LeaveBalance data = leaveList[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            rowDataWithSno(context, (index + 1).toString(), data.leaveTypeName, data.leaveBalance.toString()),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void leaveRequest() async {
    setState(() {
      isSubmit = true;
    });

    var result = await LeaveRepository()
        .postLeaveApplication(userData, fromDate, toDate, leaveType?.leaveTypeId ?? -1, applicabilityType?.applicabilityTypeId ?? -1, remark.text);
    setState(() {
      isSubmit = false;
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
