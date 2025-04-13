import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/screen/leave/leave_approval.dart';

import 'package:hrms/ui_values/employee_name_widget.dart';

import '../../common/navigate_page.dart';
import '../../ui_values/space_ui.dart';
import '../../ui_values/text_styles_ui.dart';
import 'leave_balance_view.dart';
import 'leave_report_screen.dart';
import 'leave_request_screen.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  late UserData userData;

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave'),
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
            InkWell(
              onTap: () {
                goToPage(context, const LeaveBalanceScreen());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('Leave Balance', style: rowDataStyle),
                ),
              ),
            ),
            hSpacer(12),
            InkWell(
              onTap: () {
                goToPage(context, const LeaveRequestScreen());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('Leave Request', style: rowDataStyle),
                ),
              ),
            ),
            hSpacer(12),
            InkWell(
              onTap: () {
                goToPage(context, const LeaveReportScreen());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('Leave Report', style: rowDataStyle),
                ),
              ),
            ),
            Visibility(
              visible: userData.userRole == '2' || userData.userRole == '3',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpacer(12),
                  InkWell(
                    onTap: () {
                      goToPage(context, const LeaveApprovalScreen(isRecommend: true));
                    },
                    child: RoundedContainer(
                      height: 42,
                      child: Center(
                        child: Text('Leave Recommend', style: rowDataStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: userData.canManageTeam(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpacer(12),
                  InkWell(
                    onTap: () {
                      goToPage(context, const LeaveApprovalScreen(isRecommend: false));
                    },
                    child: RoundedContainer(
                      height: 42,
                      child: Center(
                        child: Text('Leave Approval', style: rowDataStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
