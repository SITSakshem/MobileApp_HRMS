import 'package:flutter/material.dart';
import 'package:hrms/common/app_extensions.dart';
import 'package:hrms/common/date_extensions.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';
import '../../common/hexColor.dart';
import '../../data/model/downline_emp_list.dart';
import '../../data/model/leave_application_response.dart';
import '../../data/remote/result.dart';
import '../../data/repository/leave_repository.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';

class LeaveReportScreen extends StatefulWidget {
  const LeaveReportScreen({super.key});

  @override
  State<LeaveReportScreen> createState() => _LeaveReportState();
}

class _LeaveReportState extends State<LeaveReportScreen> {
  late UserData userData;
  List<LeaveApplication> leaveApplicationList = [];
  DateFormat dt = DateFormat('dd-MM-yyyy');

  bool isSubmitPressed = false;
  bool dataLoading = false;

  List<DownLineEmp> getDownLineEmpList = [];
  DownLineEmp? selectedType;
  int downLineEmployeeId = 0;

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    if (userData.canManageTeam()) {
      getDetailDownLineEmpDetails();
    }
    super.initState();
  }

  void getDetailDownLineEmpDetails() async {
    setState(() {
      dataLoading = true;
    });
    var result = await LeaveRepository().getApprentice(userData);
    if (result is Success) {
      getDownLineEmpList.add(DownLineEmp.allItem());
      getDownLineEmpList.addAll(result.data as List<DownLineEmp>);
      selectedType = getDownLineEmpList.firstOrNull;
    }

    setState(() {
      dataLoading = false;
    });
  }

  void getDetail() async {
    setState(() {
      isSubmitPressed = true;
      dataLoading = true;
      leaveApplicationList.clear();
    });

    var result = await LeaveRepository().getLeaveApplication(userData, '1-jan-2023', DateTime.now().toDateString(), true, downLineEmployeeId);
    if (result is Success) {
      leaveApplicationList = result.data as List<LeaveApplication>;
    }

    setState(() {
      dataLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Leave Report'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
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
              Visibility(
                  visible: !dataLoading,
                  child: InkWell(
                    onTap: () {
                      getDetail();
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
              Visibility(visible: dataLoading, child: const Center(child: CircularProgressIndicator())),
              Visibility(visible: isSubmitPressed && !dataLoading && leaveApplicationList.isEmpty, child: const Center(child: Text('No data found'))),
              Expanded(
                child: ListView.separated(
                  separatorBuilder:
                      (BuildContext context, int index) =>
                  const Divider(),
                  itemCount: leaveApplicationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    LeaveApplication data =
                    leaveApplicationList[index];
                    return Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /**
                             * set data in  left and right
                             */
                            rowData(context, 'Application No',
                                data.transactionNo.toString()),
                            hSpacer(6),
                            // rowData(context, 'EmpCode', data.EmpCode.toString()),
                            // hSpacer(6),
                            rowData(
                                context, 'From Date', data.fromDt),
                            hSpacer(6),
                            rowData(context, 'To Date', data.toDt),
                            hSpacer(6),
                            rowData(context, 'Leave Type',
                                data.leaveType.toString()),
                            hSpacer(6),
                            rowData(context, 'No Of Day',
                                data.deductedLeave.toString()),
                            hSpacer(6),
                            rowData(context, 'Leave Status',
                                data.approvalStatus.getLeaveStatus()),
                            hSpacer(6),
                            rowData(context, 'Reason', data.remarks),
                            hSpacer(12),
                            Visibility(
                              visible: data.haveDeleteOption,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      cancelLeave(data);
                                    },
                                    child: const Text('Cancel'),
                                  ),
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
        ));
  }

  void cancelLeave(LeaveApplication data) async {
    setState(() {
      dataLoading = true;
    });
    //var result = await LoginAPI.cancelLeaveRequest(loginDetail.empId, loginDetail.userName, loginDetail.userRole, loginDetail.token, data);
    setState(() {
      dataLoading = false;
    });
    /*if (result == true) {
      showAlertDataSubmit(context, 'Data Cancelled Successfully', getDetail);
    } else {
      showAlertDataSubmit(context, 'Something went wrong.Try Again', getDetail);
    }*/
  }
}
