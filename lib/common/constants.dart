
import 'package:flutter/material.dart';
import '../data/model/punch_type.dart';
import 'hexColor.dart';

const String appName='OurHRMS';

final viewBg = HexColor('#f8f8f8');
final lblValue = HexColor('#222222');
final themeColor = HexColor('#ad1a7f');
final colorAccent = HexColor('#ff2068');
final colorPrimaryDark = HexColor('#6d0094');
final colorAccentSecondary = HexColor('#6d0094');

const greyColor = Color(0xffaeaeae);
const greyColor2 = Color(0xffE8E8E8);
const themeColor2 = Color(0xff203152);
const primaryColor = Color(0xff203152);
const Color lightBlack = Color(0xFF525151);


List<PunchType> getPunchTypes() {
  List<PunchType> list = [
    PunchType(1, "Punch in"),
    PunchType(2, "Punch out"),
    PunchType(3, "Intermediate punch"),
  ];
  return list;
}