import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/outdoor_response.dart';
import 'package:hrms/data/repository/outdoor_repository.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';
import 'package:intl/intl.dart';

import '../../common/hexColor.dart';
import '../../data/model/downline_emp_list.dart';
import '../../data/remote/result.dart';
import '../../data/repository/leave_repository.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';

class OutdoorReportScreen extends StatefulWidget {
  const OutdoorReportScreen({super.key});

  @override
  State<OutdoorReportScreen> createState() => _OutdoorReportScreenState();
}

class _OutdoorReportScreenState extends State<OutdoorReportScreen> {
  late UserData userData;
  List<OutdoorReport> applicationList = [];

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
        title: const Text('Outdoor Report'),
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
                        child: const Center(child: Text('Submit', style: TextStyle(color: Colors.white)))),
                  )),
              hSpacer(12),
              Visibility(visible: dataLoading, child: const Center(child: CircularProgressIndicator())),
              Visibility(visible: isSubmitPressed && !dataLoading && applicationList.isEmpty, child: const Center(child: Text('No data found'))),
              Visibility(
                  visible: isSubmitPressed && applicationList.isNotEmpty,
                  child: Container(
                    //padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //color: HexColor('#72A8D4'),
                    ),
                    child: rowDataAReportHead(context, 'Date', 'In', 'Out', 'Status'),
                  )),
              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return Container();
                      },
                      itemCount: applicationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var currentData = applicationList[index];
                        return Container(
                            //padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: rowDataReport(context, currentData.attendanceDt, currentData.inTime, currentData.outTime, "Pending"));
                      })),
            ],
          ),
        ),
      ),
    );
  }

  void checkReport() async {
    setState(() {
      isSubmitPressed = true;
      dataLoading = true;
      applicationList.clear();
    });
    var result = await OutdoorRepository().getOutdoorApplication(userData, fromDate, toDate, false, downLineEmployeeId);
    if (result is Success) {
      applicationList = result.data as List<OutdoorReport>;
    }
    setState(() {
      dataLoading = false;
    });
  }
}
