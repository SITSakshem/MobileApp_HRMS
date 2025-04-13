import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';
import '../../common/hexColor.dart';
import '../../service/models/regular_report_model.dart';
import '../../ui_values/space_ui.dart';

class RegularApprovalScreen extends StatefulWidget {
  final bool? isRecommend;

  const RegularApprovalScreen({Key? key, this.isRecommend}) : super(key: key);

  @override
  State<RegularApprovalScreen> createState() => _RegularApprovalScreenState();
}

class _RegularApprovalScreenState extends State<RegularApprovalScreen> {
  late UserData userData;
  RegularReportModel leaveReport = RegularReportModel();
  DateFormat dt = DateFormat('dd-MM-yyyy');
  bool dataLoading = false;

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Regularization Approval'),
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
              dataLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                        itemCount: leaveReport.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          RegularReportModelData data = leaveReport.data![index];
                          var fromDt = dt.format(DateTime.parse(data.forDate.toString()));
                          //var toDt=dt.format(DateTime.parse(data.ToDate.toString()));
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

                                  rowData(context, 'Application No', data.appNo.toString()),
                                  hSpacer(6),
                                  rowData(context, 'Employee ID', data.empCode.toString()),
                                  hSpacer(6),
                                  rowData(context, 'Employee Name', data.eName.toString()),
                                  hSpacer(6),
                                  rowData(context, 'From Date', fromDt.toString()),
                                  hSpacer(6),
                                  rowData(context, 'in time', data.inTime.toString()),
                                  hSpacer(6),
                                  rowData(context, 'out time', data.outTime.toString()),
                                  hSpacer(6),
                                  rowData(context, 'Status', data.status.toString()),
                                  hSpacer(6),
                                  rowData(context, 'Reason', data.remarks.toString()),
                                  hSpacer(12),
                                  // Visibility(
                                  //   visible: data.LeaveStatus.toString()=='Pending',
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.end,
                                  //     children: [
                                  //       ElevatedButton(
                                  //         onPressed: () {
                                  //           cancelLeave(data);
                                  //
                                  //         },
                                  //         child: const Text('Cancel'),
                                  //       ),
                                  //
                                  //     ],
                                  //   ),
                                  // ),

                                  /**
                             * show checkbox in listview
                             */
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Checkbox(
                                        value: data.isSelected,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            data.isSelected = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

              /**
               * fix button in bottom
               */
              Visibility(
                visible: dataLoading == false && leaveReport.data?.isNotEmpty == true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        List<RegularReportModelData> selectedList = leaveReport.data!.where((element) => element.isSelected == true).toList();
                        if (selectedList.isNotEmpty) {
                          // need to implement
                        } else {
                          showAlertRecord(context);
                        }
                      },
                      child: RoundedContainer(
                          height: 38,
                          width: 250,
                          containerBGColor: HexColor('#72A8D4'),
                          child: Center(
                              child: Text(
                            (widget.isRecommend == true) ? 'Recommend' : 'Approve',
                            style: TextStyle(color: Colors.white),
                          ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void showAlertRecord(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text('Please select at least one record'),
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
}
