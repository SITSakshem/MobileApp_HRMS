import 'package:flutter/material.dart';
import 'package:hrms/common/constants.dart';
import 'package:hrms/common/hexColor.dart';
import 'package:hrms/common/navigate_page.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/salemodules/dailysale/daily_sale_screen.dart';
import 'package:hrms/salemodules/purchaseentry/purchase_entry_screen.dart';
import 'package:hrms/salemodules/routeplan/RoutePlanListScreen.dart';
import 'package:hrms/salemodules/saleorderbooking/sale_order_booking_screen.dart';
import 'package:hrms/screen/attendance/attendance_screen.dart';
import 'package:hrms/screen/leave/leave_screen.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:hrms/ui_values/space_ui.dart';
import 'package:logger/logger.dart';
import 'dart:math' as math;
import '../routeplan/route_plan_screen.dart';


class SaleDashboardHomeScreen extends StatefulWidget {
  const SaleDashboardHomeScreen({super.key});

  @override
  State<SaleDashboardHomeScreen> createState() => _SaleDashboardHomeScreenState();
}

class _SaleDashboardHomeScreenState extends State<SaleDashboardHomeScreen> {
  late UserData userData;
  bool isLeaveMenuOpen = false;
  bool isReportMenuOpen = false;
  bool isHelpDeskMenuOpen = false;
  bool isUtilityMenuOpen = false;
  bool isMiscellaneousMenuOpen = false;
  bool isManageTeamMemberMenuOpen = false;
  bool isVersionMenuOpen = false;

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    Logger().i("initState() isLogin: ${MySharedPreference().getIsLogin()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),backgroundColor: Colors.blue[200]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeMenu(context, HexColor('#CF6282'), Icons.person, 'Route Plan', () {
                    if(userData.canManageTeam()) {
                      goToPage(context, const RoutePlanScreen());
                    } else {
                      goToPage(context, const RoutePlanScreen());
                    }
                  }),
                  vSpacer(w * 0.03),
                  homeMenu(context, HexColor('#4458A6'), Icons.person, 'Sale Order Booking', () {
                    goToPage(context, const SaleOrderBookingScreen());
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeMenu(context, HexColor('#CF6282'), Icons.person, 'Purchase Entry', () {
                    goToPage(context, const PurchaseEntryScreen());
                  }),
                  vSpacer(w * 0.03),
                  homeMenu(context, HexColor('#4458A6'), Icons.person, 'Daily Sale', () {
                    goToPage(context, const DailySaleScreen());
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
