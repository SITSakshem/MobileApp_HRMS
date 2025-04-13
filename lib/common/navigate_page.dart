import 'package:flutter/material.dart';
import 'package:hrms/screen/login_flow/CompanyCodeScreen.dart';
import 'package:hrms/screen/login_flow/logout_screen.dart';
import '../screen/dashboard/home_screen.dart';
import '../screen/login_flow/login_screen.dart';
import '../screen/login_flow/qrcode_screen.dart';

goToLandingPage(context, className) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => className));
}

goToPage(context, className) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => className));
}

goToPushReplacePage(context, className) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => className));
}

goToDashboard(context) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (Route<dynamic> route) => false);
}

goToLogout(context) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LogoutScreen()), (Route<dynamic> route) => false);
}

goToLoginAfterLogout(context) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const CompanyCodeScreen()), (Route<dynamic> route) => false);
}

goToLogin(context, className) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => className));
}

goToZoomImage(context, image) {
  // Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => ZoomImage(url: image)));
}

goToQRCodePage(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const QRCodeScreen()));
}
