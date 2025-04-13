import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hrms/data/local/my_shared_preference.dart';
import 'package:hrms/screen/login_flow/CompanyCodeScreen.dart';
import 'package:hrms/screen/dashboard/home_screen.dart';
import 'package:hrms/screen/login_flow/login_screen.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:logger/web.dart';
import '../../common/navigate_page.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool isLogin = false;
  @override
  initState() {
    super.initState();
    isLogin = false;
    // MySharedPreference().getIsLogin();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      callDashboard(context);
    });
  }

  void callDashboard(context) async {
    Timer(const Duration(seconds: 2), () async {
      //goToPushReplacePage(context, isLogin ? const HomeScreen() : const LoginScreen());
      goToPushReplacePage(context, isLogin ? const HomeScreen() : const CompanyCodeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: logoTile(context),
      ),
    );
  }
}
