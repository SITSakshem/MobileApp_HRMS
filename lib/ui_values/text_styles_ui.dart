import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../common/hexColor.dart';

const TextStyle linkTextStyle =
    TextStyle(fontSize: 16.0, decoration: TextDecoration.underline, color: Colors.blueAccent, fontWeight: FontWeight.w800);

final TextStyle loadTextStyle = TextStyle(fontSize: 18.0, decoration: TextDecoration.none, color: colorPrimaryDark, fontWeight: FontWeight.w800);

const TextStyle headingTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 21.0,
  fontWeight: FontWeight.bold,
);

const TextStyle numberTextStyle = TextStyle(
  color: themeColor2,
  fontSize: 21.0,
  fontWeight: FontWeight.normal,
  decoration: TextDecoration.none,
);

const TextStyle menuTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

TextStyle rowDataStyle = TextStyle(
  color: HexColor('#28427A'),
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
);
