import 'package:flutter/material.dart';
import 'package:hrms/ui_values/space_ui.dart';

import '../common/hexColor.dart';
import 'text_styles_ui.dart';

class EmployeeNameWidget extends StatelessWidget {
  final String name;

  const EmployeeNameWidget(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
        containerBGColor: HexColor('#72A8D4'),
        child: Text(name, style: numberTextStyle.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)
        ));
  }
}
