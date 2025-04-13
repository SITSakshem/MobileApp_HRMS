
import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/screen/compOff/comp_off_approval.dart';

import 'package:hrms/ui_values/employee_name_widget.dart';

import '../../common/navigate_page.dart';
import '../../ui_values/space_ui.dart';
import '../../ui_values/text_styles_ui.dart';
import 'comp_off_request_screen.dart';


class CompOffScreen extends StatefulWidget {
  const CompOffScreen({super.key});

  @override
  State<CompOffScreen> createState() => _CompOffScreenState();
}

class _CompOffScreenState extends State<CompOffScreen> {
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
        title: const Text('CompOff'),
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
                goToPage(context, const CompOffRequestScreen());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('CompOff Request', style: rowDataStyle),
                ),
              ),
            ),
            hSpacer(12),
            InkWell(
              onTap: () {
                goToPage(context, const CompOffApprovalScreen(isApproval: false));
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('CompOff Report', style: rowDataStyle),
                ),
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
                      goToPage(context, const CompOffApprovalScreen(isApproval: true));
                    },
                    child: RoundedContainer(
                      height: 42,
                      child: Center(
                        child: Text('CompOff Approval', style: rowDataStyle),
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
