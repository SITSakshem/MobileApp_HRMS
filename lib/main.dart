import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms/screen/login_flow/CompanyCodeScreen.dart';
import 'package:hrms/screen/login_flow/landing_screen.dart';
import 'package:hrms/screen/login_flow/login_screen.dart';
import 'package:provider/provider.dart';

import 'data/local/my_shared_preference.dart';
import 'data/remote/ApiService.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late MySharedPreference mySharedPreference;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(MySharedPreference.prefFile);
  mySharedPreference = MySharedPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'OurHRMS',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale('en')],
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          fontFamily: 'Georgia',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: mySharedPreference.getIsLogin() ? const LoginScreen() : const CompanyCodeScreen(),
        //home: const SafeArea(child: Landing()),
      ),
    );
  }
}
