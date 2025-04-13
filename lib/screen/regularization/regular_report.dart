import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/service/models/regular_report_model.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';
import '../../ui_values/space_ui.dart';

class RegularReportScreen extends StatefulWidget {
  const RegularReportScreen({super.key});

  @override
  State<RegularReportScreen> createState() => _RegularReportScreenState();
}

class _RegularReportScreenState extends State<RegularReportScreen> {
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
          title: const Text('Regularization Report'),
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
                          // var toDt=dt.format(DateTime.parse(data.ToDate.toString()));
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
                                  Visibility(
                                    visible: data.status.toString() == 'Pending',
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
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
                    ),
            ],
          ),
        ));
  }
}
