import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/repository/leave_repository.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';

import '../../data/model/leave_balance.dart';
import '../../data/remote/result.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';

class LeaveBalanceScreen extends StatefulWidget {
  const LeaveBalanceScreen({super.key});

  @override
  State<LeaveBalanceScreen> createState() => _LeaveBalanceScreenState();
}

class _LeaveBalanceScreenState extends State<LeaveBalanceScreen> {
  late UserData userData;
  late List<LeaveBalance> leaveList;
  bool dataLoading = false;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Balance'),
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
                    child: CircularProgressIndicator(), )
                : leaveList.isEmpty
                    ? const Center(
                        child: Text("You have insufficient leave available!!"),
                      )
                    : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemCount: leaveList.length,
                      itemBuilder: (BuildContext context, int index) {
                        LeaveBalance data = leaveList[index];
                        return Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                rowData(context, 'Leave Type', data.leaveTypeName.toString()),
                                hSpacer(6),
                                rowData(context, 'Leave Balance', data.leaveBalance.toString()),
                                hSpacer(6),
                                rowData(context, 'Freeze Balance', data.freezeBalance.toString()),
                                hSpacer(6),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
