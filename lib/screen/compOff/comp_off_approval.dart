import 'package:flutter/material.dart';
import 'package:hrms/common/app_extensions.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/applied_comp_off_response.dart';
import 'package:hrms/data/model/base_response.dart';
import 'package:hrms/data/repository/comp_off_repository.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';
import '../../common/hexColor.dart';
import '../../data/model/downline_emp_list.dart';
import '../../data/remote/result.dart';
import '../../data/repository/leave_repository.dart';
import '../../ui_values/space_ui.dart';

class CompOffApprovalScreen extends StatefulWidget {
  final bool isApproval;

  const CompOffApprovalScreen({super.key, required this.isApproval});

  @override
  State<CompOffApprovalScreen> createState() => _CompOffApprovalScreenState();
}

class _CompOffApprovalScreenState extends State<CompOffApprovalScreen> {
  late UserData userData;
  List<AppliedCompOff> compOffApplicationList = [];
  DateTime now = DateTime.now();
  DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
  DateTime fromDateDate = DateTime.now();
  DateTime toDateDate = DateTime.now();
  late String fromDate = dateFormatter.format(now);
  late String toDate = dateFormatter.format(now);
  final formKey = GlobalKey<FormState>();

  bool isSubmitPressed = false;
  bool dataLoading = false;

  List<DownLineEmp> getDownLineEmpList = [];
  DownLineEmp? selectedType;
  int downLineEmployeeId = 0;

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    // no need to load down line employee for employee role
    if (userData.canManageTeam()) {
      getDetailDownLineEmpDetail();
    }
    super.initState();
  }

  void getDetailDownLineEmpDetail() async {
    setState(() {
      dataLoading = true;
    });
    var result = await LeaveRepository().getApprentice(userData);
    if (result is Success) {
      getDownLineEmpList.add(DownLineEmp.allItem());
      getDownLineEmpList.addAll(result.data as List<DownLineEmp>);
      selectedType = getDownLineEmpList.firstOrNull;
    } else {
      getDownLineEmpList = [];
    }
    setState(() {
      dataLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CompOff Report'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Employee ID & Name'),
                hSpacer(6),
                EmployeeNameWidget("${userData.empCode} - ${userData.empName}"),
                hSpacer(12),
                Visibility(visible: userData.canManageTeam(), child: const FormThemedText('Employee')),
                Visibility(
                    visible: userData.canManageTeam(),
                    child: RoundedBox(
                      height: 52,
                      marginTop: 0,
                      marginBottom: 0,
                      child: DropdownButton<DownLineEmp>(
                        isExpanded: true,
                        value: selectedType,
                        items: getDownLineEmpList.map((DownLineEmp value) {
                          return DropdownMenuItem<DownLineEmp>(
                            value: value,
                            child: ThemedText(text: value.downLineEmpName.toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedType = value;
                            if (value != null) {
                              downLineEmployeeId = value.downLineEmpId;
                            }
                          });
                        },
                      ),
                    )),
                hSpacer(12),
                const FormThemedText('From Date'),
                InkWell(
                  onTap: () {
                    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(now.year), lastDate: DateTime(now.year + 1))
                        .then((value) {
                      setState(() {
                        fromDate = dateFormatter.format(value ?? DateTime.now());
                      });
                    });
                  },
                  child: RoundedBox(
                      height: 42,
                      child: Row(
                        children: [ThemedText(text: fromDate), const Spacer(), const Icon(Icons.calendar_today)],
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
                        toDateDate = value ?? toDateDate;
                        toDate = dateFormatter.format(toDateDate);
                      });
                    });
                  },
                  child: RoundedBox(
                      height: 42,
                      child: Row(
                        children: [ThemedText(text: toDate), const Spacer(), const Icon(Icons.calendar_today)],
                      )),
                ),
                hSpacer(12),
                Visibility(
                    visible: !dataLoading,
                    child: InkWell(
                      onTap: () {
                        if (toDateDate.isBefore(fromDateDate)) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('To date must be greater than From date')));
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          checkReport();
                        }
                      },
                      child: RoundedContainer(
                          height: 38,
                          containerBGColor: HexColor('#72A8D4'),
                          child: const Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ))),
                    )),

                hSpacer(12),
                Visibility(visible: dataLoading, child: const Center(child: CircularProgressIndicator())),
                Visibility(visible: isSubmitPressed && !dataLoading && compOffApplicationList.isEmpty, child: const Center(child: Text('No data found'))),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount: compOffApplicationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      AppliedCompOff data = compOffApplicationList[index];
                      return Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /**
                               * set data in  left and right
                               */
                              rowData(context, 'Application No', data.transactionNo.toString()),
                              hSpacer(6),
                              //rowData(context, 'EmpCode', data.empCode.toString()),
                              //hSpacer(6),
                              rowData(context, 'Employee Name', data.empName.toString()),
                              hSpacer(6),
                              rowData(context, 'From Date', data.attendanceDt.toDateString()),
                              hSpacer(6),
                              rowData(context, 'Status', data.approvalStatus.getLeaveStatus()),
                              hSpacer(6),
                              rowData(context, 'Reason', data.remarks),
                              hSpacer(12),
                              Visibility(
                                visible: widget.isApproval,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        updateCompOffStatus(data, 1);
                                      },
                                      child: const Text('Approve'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        updateCompOffStatus(data, 2);
                                      },
                                      child: const Text('Cancel'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void checkReport() async {
    setState(() {
      dataLoading = true;
      isSubmitPressed = true;
      compOffApplicationList.clear();
    });
    var result = await CompOffRepository().getCompOffRaiseApplication(userData, fromDate, toDate, false, downLineEmployeeId);
    if (result is Success) {
      compOffApplicationList = result.data as List<AppliedCompOff>;
    }
    setState(() {
      dataLoading = false;
    });
  }


  void showAlertRecord(BuildContext context, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void updateCompOffStatus(AppliedCompOff data, int status) async {
    setState(() {
      dataLoading = true;
    });

    var result = await LeaveRepository().approveLeave(userData, data.transactionNo, status, "test development approve");
    if (result is Success) {
      BaseResponse response = result.data;
      showAlertRecord(context, response.message);
    } else {
      showAlertRecord(context, 'Something went wrong.Try Again');
    }
  }
}
