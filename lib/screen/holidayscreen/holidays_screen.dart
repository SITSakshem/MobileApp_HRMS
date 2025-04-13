import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/screen/outdoor/outdoor_report_screen.dart';
import 'package:hrms/screen/outdoor/request_outdoor_screen.dart';
import 'package:hrms/ui_values/employee_name_widget.dart';

import '../../common/navigate_page.dart';
import '../../ui_values/space_ui.dart';
import '../../ui_values/text_styles_ui.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
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
        title: const Text('Holidays'),
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
            hSpacer(18),
            const Center(
              child: Text("Coming Soon!!"),
            )
            /*InkWell(
              onTap: () {
                goToPage(context, const OutdoorReportScreen());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('Outdoor Report', style: rowDataStyle),
                ),
              ),
            ),
            hSpacer(12),
            InkWell(
              onTap: () {
                goToPushReplacePage(context, const RequestOutdoorScreen());
              },
              child: RoundedContainer(
                height: 42,
                child: Center(
                  child: Text('New', style: rowDataStyle),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
