import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/screen/regularization/regular_approval.dart';
import 'package:hrms/screen/regularization/regular_report.dart';
import 'package:hrms/screen/regularization/regular_request.dart';
import 'package:hrms/screen/regularization/regularized_attendance_new.dart';

import '../../common/navigate_page.dart';
import '../../ui_values/employee_name_widget.dart';
import '../../ui_values/space_ui.dart';
import '../../ui_values/text_styles_ui.dart';

class RegularScreen extends StatefulWidget {
  const RegularScreen({super.key});

  @override
  State<RegularScreen> createState() => _RegularScreenState();
}

class _RegularScreenState extends State<RegularScreen> {
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
        title: const Text('Regularization'),
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
                goToPage(context, const RegularizedAttendanceNew());
                //goToPage(context, const RegularRequestScreen());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('Regularization Request', style: rowDataStyle),
                ),
              ),
            ),
            hSpacer(12),
            InkWell(
              onTap: () {
                goToPage(context, const RegularizedAttendanceNew());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('Regularization Report', style: rowDataStyle),
                ),
              ),
            ),
            /*Visibility(
              visible: userData.userRole == '2' || userData.userRole == '3',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpacer(12),
                  InkWell(
                    onTap: () {
                      goToPage(
                          context,
                          const RegularApprovalScreen(
                            isRecommend: true,
                          ));
                    },
                    child: RoundedContainer(
                      height: 42,
                      child: Center(
                        child: Text('Regularization Recommend', style: rowDataStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
           /* Visibility(
              visible: userData.userRole == '3',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpacer(12),
                  InkWell(
                    onTap: () {
                      goToPage(context, const RegularApprovalScreen(isRecommend: false));
                    },
                    child: RoundedContainer(
                      height: 42,
                      child: Center(
                        child: Text('Regularization Approval', style: rowDataStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
