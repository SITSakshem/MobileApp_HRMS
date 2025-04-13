import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/screen/attendance/attendance_report.dart';
import 'package:hrms/screen/attendance/mark_attendance.dart';
import 'package:hrms/screen/attendance/mobile_attendance.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';

import '../../common/hexColor.dart';
import '../../common/navigate_page.dart';
import '../../ui_values/controls_ui.dart';
import '../../ui_values/space_ui.dart';
import '../../ui_values/text_styles_ui.dart';
import 'mobile_punch_attendance_report.dart';

class AttendanceScreen extends StatefulWidget {
  final bool isMobilePunch;

  const AttendanceScreen({this.isMobilePunch = false, super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
        title: Text(widget.isMobilePunch ? "Mobile Punch" : 'Attendance'),
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

            conditionalWidget(
                isTrue: userData.isMobilePunchApplicable,
                first: attendanceConditionalMenu(context, HexColor('#D77B88'), Icons.person, "MobilePunch Report", () {
                  goToPage(context, const MobilePunchAttendanceReportScreen());
                }),
                second: attendanceConditionalMenu(context, HexColor('#D77B88'), Icons.person, "Attendance Report", () {
                  goToPage(context, const AttendanceReport());
                })),
            hSpacer(12),
            InkWell(
              onTap: () {
                goToPushReplacePage(context, widget.isMobilePunch ? const MobilePunchScreen() : const MarkAttendance());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('Mark Attendance', style: rowDataStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
