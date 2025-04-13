import 'package:flutter/material.dart';
import 'package:hrms/common/constants.dart';
import 'package:hrms/common/navigate_page.dart';
import 'package:hrms/ui_values/controls_ui.dart';
import 'package:hrms/ui_values/space_ui.dart';

import 'login_screen.dart';

enum LoginStep { companyCode, credentials }

class QRCodeScreen extends StatefulWidget {
  final LoginStep step;

  const QRCodeScreen({Key? key, this.step = LoginStep.companyCode}) : super(key: key);

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  TextEditingController companyValue = TextEditingController();
  final _companyCode = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              logoTile(context),
              const Icon(Icons.qr_code),
              hSpacer(12),
              ThemedTextField(
                text: 'company code',
                tec: companyValue,
              ),
              hSpacer(12),
              ThemedButton(
                text: 'Next',
                onPressed: () {
                  goToLogin(context, const LoginScreen());
                },
              ),
            ],
          )),
    );
  }
}
