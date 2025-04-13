import 'package:flutter/material.dart';
import 'package:hrms/common/constants.dart';
import 'package:hrms/common/navigate_page.dart';
import 'package:hrms/data/local/my_shared_preference.dart';

/// clear all sharedPreference data and logout from app

class LogoutScreen extends StatefulWidget{
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {

  @override
  void initState() {
    //create Timer of 3 seconds and navigate to login screen
    Future.delayed(const Duration(seconds: 2), () {
      MySharedPreference().resetLogin(false);
      MySharedPreference.clearCredentials();
      MySharedPreference.clearCompanyCode();
      MySharedPreference.clearCompanyName();
      MySharedPreference.clearUserNameCode();
      goToLoginAfterLogout(context);
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: const Center(
        child: Text('Logout'),
      ),
    );
  }
}