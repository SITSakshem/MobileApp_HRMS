import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/common/app_extensions.dart';
import 'package:hrms/common/constants.dart';
import 'package:hrms/common/date_extensions.dart';
import 'package:hrms/common/hexColor.dart';
import 'package:hrms/common/navigate_page.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/data/local/user_data.dart';
import 'package:hrms/data/model/day_attendance_response.dart';
import 'package:hrms/data/repository/attendance_repository.dart';
import 'package:hrms/screen/attendance/attendance_screen.dart';
import 'package:hrms/screen/compOff/comp_off_screen.dart';
import 'package:hrms/screen/eventsscreen/events_screen.dart';
import 'package:hrms/screen/holidayscreen/holidays_screen.dart';
import 'package:hrms/screen/leave/leave_screen.dart';
import 'package:hrms/screen/dashboard/profile_screen.dart';
import 'package:hrms/screen/outdoor/outdoor_screen.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:hrms/ui_values/space_ui.dart';
import 'package:hrms/ui_values/text_styles_ui.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;


import '../../salemodules/dailysale/daily_sale_screen.dart';
import '../../salemodules/purchaseentry/purchase_entry_screen.dart';
import '../../salemodules/report/get_store_report_screen.dart';
import '../../salemodules/report/get_total_sales_amount_report_screen.dart';
import '../../salemodules/report/get_total_sales_booking_report_screen.dart';
import '../../salemodules/routeplan/route_plan_screen.dart';
import '../../salemodules/saledashboard/sale_dashboard_screen.dart';

import '../../data/remote/result.dart';

import '../../salemodules/saleorderbooking/sale_order_booking_screen.dart';
import '../leave/leave_report_screen.dart';
import '../leave/leave_request_screen.dart';
import '../regularization/regular_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Attendance> _attendanceList = [];
  final HashMap<DateTime, bool> _isDataLoaded = HashMap();
  late UserData userData;
  bool isLeaveMenuOpen = false;
  bool isReportMenuOpen = false;
  bool isHelpDeskMenuOpen = false;
  bool isUtilityMenuOpen = false;
  bool isMiscellaneousMenuOpen = false;
  bool isManageTeamMemberMenuOpen = false;
  bool isVersionMenuOpen = false;
  bool _dataLoading = false;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusDate = DateTime.now();

  @override
  void initState() {
    userData = MySharedPreference().getUserData();
    Logger().i("initState() isLogin: ${MySharedPreference().getIsLogin()}");
    loadData(DateTime.now());
    super.initState();
  }

  Future<void> loadData(DateTime time) async {
    setState(() {
      _dataLoading = true;
    });
    DateTime startTime = time.toStartOfMonth();
    DateTime endTime = time.toEndOfMonth();
    var result = await AttendanceRepository().getDayAttendance(userData, startTime.toDateString(), endTime.toDateString());
    if (result is Success) {
      var list = (result.data as DayAttendance).attendance;
      if(list.isNotEmpty) {
        _isDataLoaded.assign(time, true);
        _attendanceList.addAll(list);
      }
    }
    setState(() {
      _dataLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(title: const Text(appName), backgroundColor: Colors.blue[200],
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Home'.toUpperCase(),
                      style: numberTextStyle.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Utility'.toUpperCase(),
                      style: numberTextStyle.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Report'.toUpperCase(),
                      style: numberTextStyle.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              )),
          drawer: drawerBuild(context),
          body: TabBarView(
            children: [
              homeTabContent(),
              utilitySaleModulesTabContent(),
              storeReportTabContentNew()
            ],
          ),
        )
      ),
    );
  }

  //This method is used for Home
  Widget homeTabContent(){
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 8.0),
              child: RoundedContainer(
                height: 96,
                child: Row(
                  children: [
                    const SizedBox(width: 96, child: Icon(Icons.person, size: 48)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(userData.empName), Text(userData.designation), Text(userData.department)],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeMenu(context, HexColor('#CF6282'), Icons.person, 'My Profile', () {
                    goToPage(context, const ProfileScreen());
                  }),
                  vSpacer(w * 0.03),
                  homeMenu(context, HexColor('#4458A6'), Icons.person, 'Leaves', () {
                    goToPage(context, const LeaveScreen());
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
                  homeMenu(context, HexColor('#69B5BB'), Icons.person, 'Outdoor', () {
                    goToPage(context, const OutdoorScreen());
                  }),
                  vSpacer(w * 0.03),
                  conditionalWidget(
                      isTrue: userData.isMobilePunchApplicable,
                      first: homeMenu(context, HexColor('#D77B88'), Icons.person, "Mobile Punch", () {
                        goToPage(context, const AttendanceScreen(isMobilePunch: true));
                      }),
                      second: homeMenu(context, HexColor('#D77B88'), Icons.person, "Attendance", () {
                        goToPage(context, const AttendanceScreen(isMobilePunch: false));
                      }))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeMenu(context, HexColor('#967AED'), Icons.person, 'CompOff', () {
                    goToPage(context, const CompOffScreen());
                  }),
                  vSpacer(w * 0.03),
                  homeMenu(context, HexColor('#AD741C'), Icons.person, 'Holidays', () {
                    goToPage(context, const HolidayScreen());
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
                  homeMenu(context, HexColor('#4458A6'), Icons.person, 'Events', () {
                    goToPage(context, const EventsScreen());
                  }),
                  vSpacer(w * 0.03),
                  homeMenu(context, HexColor('#69B5BB'), Icons.person, 'Regularization', () {
                    goToPage(context, const RegularScreen());
                  }),
                  //homeMenu(context, HexColor('#69B5BB'), Icons.person, 'Salary Slip', () {}),
                ],
              ),
            ),
            Visibility(
                visible: _dataLoading,
                child: Column(
                  children: [
                    hSpacer(12),
                    const Center(child: CircularProgressIndicator()),
                  ],
                )),
            hSpacer(12),
            SingleChildScrollView(
              child: ListView(
                shrinkWrap: true, // Prevents infinite height issue
                physics: const NeverScrollableScrollPhysics(), // To avoid nested scroll issues
                children: [
                  TableCalendar(
                    rowHeight: 70,
                    availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                    weekNumbersVisible: false,
                    firstDay: DateTime.utc(2023, 01, 01),
                    lastDay: DateTime.now(),
                    focusedDay: _focusDate,
                    calendarStyle: CalendarStyle(
                        cellMargin: const EdgeInsets.all(0),
                        weekendDecoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(width: .2, color: Colors.black12)),
                        weekendTextStyle: const TextStyle(color: Colors.black26, fontSize: 10.0),
                        selectedTextStyle: const TextStyle(color: Colors.black, fontSize: 10.0),
                        todayTextStyle: const TextStyle(color: Colors.black, fontSize: 10.0),
                        disabledTextStyle: const TextStyle(fontSize: 10.0, color: Colors.black),
                        disabledDecoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(width: .2, color: Colors.black12)),
                        outsideDecoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(width: .2, color: Colors.black12)),
                        outsideTextStyle: const TextStyle(fontSize: 10.0, color: Colors.black26),
                        selectedDecoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(width: .5, color: Colors.black12)),
                        todayDecoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(width: 1, color: Colors.black)),
                        defaultDecoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(width: .2, color: Colors.black12)),
                        defaultTextStyle: const TextStyle(fontSize: 10.0),
                        withinRangeTextStyle: const TextStyle(color: Colors.black, fontSize: 10.0)),
                    calendarFormat: _calendarFormat,
                    onPageChanged: (time) {
                      _focusDate = time;
                      Logger().i("onPageChanged() $time");
                      if(_isDataLoaded[time] == null) {
                        loadData(time);
                      }
                    },
                    calendarBuilders: CalendarBuilders(markerBuilder: (context, day, events) => _buildMonthRangeCell(day)),
                  )
                ],
              ),
            )

          ],
        ),
      );
  }

  //This method is used for Sale Module tab
  Widget utilitySaleModulesTabContent(){
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
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
        ],
      ),
    );
  }



  //This method is used for Sale Module tab
  Widget storeReportTabContent(){
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      homeMenu(context, HexColor('#CF6282'), Icons.person, 'Get Store', () {
                        goToPage(context, const GetStoreReportScreen());
                        /*if(userData.canManageTeam()) {
                          goToPage(context, const GetStoreReportScreen());
                        } else {
                          goToPage(context, const GetTotalSalesAmountReportScreen());
                        }*/
                      }),
                      vSpacer(w * 0.03),
                      homeMenu(context, HexColor('#4458A6'), Icons.person, 'Total Sales Amount', () {
                        goToPage(context, const GetTotalSalesAmountReportScreen());
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
                      homeMenu(context, HexColor('#CF6282'), Icons.person, 'Total Sales Booking', () {
                        goToPage(context, const GetTotalSalesBookingReportScreen());
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //This method is used for Store list report tab
  Widget storeReportTabContentNew(){
    return SingleChildScrollView(
      child: Column(
        children: [
          saleReportContainer(context, 'assets/store.png', 'STORE', '25', () {
            goToPage(context, const GetStoreReportScreen());
          }),
          saleReportContainer(context,'assets/profit_up.png', 'TOTAL SALE AMOUNT', '7020', () {
            goToPage(context, const GetTotalSalesAmountReportScreen());
          }),
          saleReportContainer(context, 'assets/sales_amount.png', 'TOTAL SALE BOOKING', '6279', () {
            goToPage(context, const GetTotalSalesBookingReportScreen());
          }),
        ],
      ),
    );
  }


  Widget? _buildMonthRangeCell(DateTime day) {
    final attendance = _attendanceList.firstWhereOrNull((data) {
      final attendanceDate = data.attendanceDt.toDate();
      return attendanceDate.day == day.day && attendanceDate.month == day.month && attendanceDate.year == day.year;
    });
    //final attendance = attendanceData[day];
    if (attendance != null) {
      Color timeTextBackgroundColor = _getTimeBackgroundColor(attendance);
      Color timeTextColor = _getTimeTextColor(attendance);
      Color bgColor = _getBackgroundColor(attendance);
      if (attendance.isHoliday || attendance.isWeekoff) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${day.day}", style: const TextStyle(fontSize: 10)),
            hSpacer(2),
            Text(attendance.dayStatusName, style: TextStyle(fontSize: 10, backgroundColor: bgColor, color:timeTextColor)),
          ],
        );
      } else  {
        return Column(
          children : [
            Text("${day.day}", style: const TextStyle(fontSize: 10)),
            Text(attendance.inTime, style: TextStyle(fontSize: 10, backgroundColor: timeTextBackgroundColor, color:timeTextColor)),
            hSpacer(2),
            Text(attendance.outTime, style: TextStyle(fontSize: 10, backgroundColor: timeTextBackgroundColor, color:timeTextColor)),
            hSpacer(2),
            Text(attendance.dayStatusName, style: TextStyle(fontSize: 10, backgroundColor: bgColor, color:timeTextColor, wordSpacing: 10.0)),
          ],
        );
      }

    }
    return null;
  }

  Color _getTimeTextColor(Attendance attendance) {
    return Colors.white;
  }
  Color _getTimeBackgroundColor(Attendance attendance) {
    return Colors.blue;
  }

  Color _getBackgroundColor(Attendance attendance) {
    if (attendance.isWeekoff || attendance.isHoliday) {
      return Colors.amberAccent;
    } else if (attendance.isLeaveApplied || attendance.dayStatusName == "Absent") {
      return Colors.red;
    } else if (attendance.inTime != "00:00" && attendance.outTime != "00:00") {
      return Colors.green;
    }
    return Colors.black;
  }

  Widget drawerBuild(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/customer.png',
                  height: 62,
                  width: 62,
                ),
                hSpacer(8),
                Text(
                  userData.empName,
                  style: numberTextStyle.copyWith(fontSize: 14),
                ),
                hSpacer(4),
                Text(
                  userData.designation,
                  style: numberTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          /**
           * create accordion menu
           *
           */
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    onTap: () {
                      goToPage(context, const HomeScreen());
                      //Navigator.pop(context);
                    },
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const MenuThemedText(text: 'Dashboard')),

                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),

                ListTile(
                    onTap: () {
                      goToPage(context, const ProfileScreen());
                    },
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const MenuThemedText(text: 'Profile')),
                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),

                ListTile(
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  onTap: () {
                    setState(() {
                      isLeaveMenuOpen = !isLeaveMenuOpen;
                    });
                  },
                  title: const MenuThemedText(text: 'Leave & Attendance'),
                  trailing: Transform.rotate(
                      angle: isLeaveMenuOpen ? (90 * math.pi / 180) : (270 * math.pi / 180),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 16,
                        color: Colors.grey,
                      )),
                ),
                Visibility(
                  visible: isLeaveMenuOpen,
                  child: Column(
                    children: [
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Leave'),
                        onTap: () {
                          goToPage(context, const LeaveRequestScreen());
                        },
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Leave List'),
                        onTap: () {
                          goToPage(context, const LeaveReportScreen());
                        },
                      ),
                    ],
                  ),
                ),

                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),

                /*ListTile(
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  onTap: () {
                    setState(() {
                      isUtilityMenuOpen = !isUtilityMenuOpen;
                    });
                  },
                  title: const MenuThemedText(text: 'Utility'),
                  trailing: Transform.rotate(
                      angle: isUtilityMenuOpen ? (90 * math.pi / 180) : (270 * math.pi / 180),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 16,
                        color: Colors.grey,
                      )),
                ),

                Visibility(
                  visible: isUtilityMenuOpen,
                  child: Column(
                    children: [
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Change Password'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),*/

               /* ListTile(
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  onTap: () {
                    setState(() {
                      isMiscellaneousMenuOpen = !isMiscellaneousMenuOpen;
                    });
                  },
                  title: const MenuThemedText(text: 'Miscellaneous'),
                  trailing: Transform.rotate(
                      angle: isMiscellaneousMenuOpen ? (90 * math.pi / 180) : (270 * math.pi / 180),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 16,
                        color: Colors.grey,
                      )),
                ),*/

                Visibility(
                  visible: isMiscellaneousMenuOpen,
                  child: Column(
                    children: [
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Privacy Policy'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),

                Visibility(
                  visible: userData.userRole == '2' || userData.userRole == '3',
                  child: Column(
                    children: [
                      ListTile(
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        onTap: () {
                          setState(() {
                            isManageTeamMemberMenuOpen = !isManageTeamMemberMenuOpen;
                          });
                        },
                        title: const MenuThemedText(text: 'Manage Team Member'),
                        trailing: Transform.rotate(
                            angle: isManageTeamMemberMenuOpen ? (90 * math.pi / 180) : (270 * math.pi / 180),
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 16,
                              color: Colors.grey,
                            )),
                      ),
                      Visibility(
                        visible: isManageTeamMemberMenuOpen,
                        child: Column(
                          children: [
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              title: const Text('Leave Sanction'),
                              onTap: () {},
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              title: const Text('CompOff Sanction'),
                              onTap: () {},
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              title: const Text('Attendance Sanction'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),

                ListTile(
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  onTap: () {
                    setState(() {
                      isVersionMenuOpen = !isVersionMenuOpen;
                    });
                  },
                  title: const MenuThemedText(text: 'Version 1.0.0'),
                  trailing: Transform.rotate(
                    angle: isUtilityMenuOpen ? (90 * math.pi / 180) : (270 * math.pi / 180),
                  ),
                ),

                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                ListTile(
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                  onTap: () {
                    goToLogout(context);
                  },
                  title: const MenuThemedText(text: 'Logout'),
                  trailing: Transform.rotate(
                    angle: isUtilityMenuOpen ? (90 * math.pi / 180) : (270 * math.pi / 180),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
