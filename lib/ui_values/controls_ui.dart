import 'package:flutter/material.dart';
import 'package:hrms/common/constants.dart';
import 'package:hrms/common/hexColor.dart';
import 'package:hrms/ui_values/space_ui.dart';
import 'package:hrms/ui_values/text_styles_ui.dart';

import 'image_ui.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? bgColor;
  final Color? textColor;

  const MyButton({Key? key, required this.onPressed, required this.text, this.bgColor, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 48,
      onPressed: onPressed,
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      color: bgColor ?? HexColor('#72A8D4'),
      textColor: textColor ?? Colors.white,
      child: Text(text),
    );
  }
}

class ThemedButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final String? text;
  final Color? bgColor;
  final Color? txtColor;

  const ThemedButton({Key? key, this.onPressed, this.text, this.child, this.bgColor, this.txtColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RoundedContainer(
        height: 48,
        containerBGColor: HexColor('589ec9'),
        child: text == null
            ? child
            : Center(
                child: Text(
                  text ?? '',
                  style: TextStyle(fontSize: 14, color: txtColor ?? Colors.white),
                ),
              ),
      ),
    );
  }
}

class ThemedTextField extends StatelessWidget {
  final String? text;
  final TextEditingController tec;
  final bool? isObscure;

  const ThemedTextField({Key? key, this.text, this.isObscure, required this.tec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: tec,
        obscureText: isObscure ?? false,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[500]),
            hintText: text,
            contentPadding: const EdgeInsets.all(16.0),
            fillColor: Colors.white70),
      ),
    );
    // return RoundedContainer(
    //   height: 48,
    //   containerBGColor: Colors.white,
    //   containerBorderColor: HexColor('589ec9'),
    //   child: text == null ? child : Center(
    //     child: TextField(controller: tec,),
    //   ),
    // );
  }
}

class ThemedText extends StatelessWidget {
  final String? text;
  final Color? txtColor;

  const ThemedText({Key? key, this.text, this.txtColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(fontSize: 14, color: txtColor ?? HexColor('#72A8D4')),
    );
  }
}

class MenuThemedText extends StatelessWidget {
  final String? text;
  final Color? txtColor;

  const MenuThemedText({Key? key, this.text, this.txtColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '', style: numberTextStyle.copyWith(color: txtColor ?? Colors.black, fontSize: 14, fontWeight: FontWeight.bold));
  }
}

class FormThemedText extends StatelessWidget {
  final String? text;
  final Color? txtColor;

  const FormThemedText(this.text, {Key? key, this.txtColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
        style: numberTextStyle.copyWith(color: txtColor ?? Colors.black.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.bold));
  }
}

Widget errorPlaque(String message) {
  return Builder(builder: (context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: primaryColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Flexible(child: Text(message, style: TextStyle(color: Theme.of(context).colorScheme.error))),
              ],
            ),
          ),
        ),
      ),
    );
  });
}

Widget logoTile(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ImageUI.logo(context),
      hSpacer(),
      Center(
        child: Text(
          'Employee Self-Service System',
          style: headingTextStyle.copyWith(color: HexColor('#6DBAD5'), fontSize: 22),
        ),
      ),
      hSpacer(),
      /*
      Center(
        child: Text(
          'MANAGE YOUR EMPLOYEES',
          style: headingTextStyle.copyWith(color: HexColor('#6DBAD5'), fontSize: 21, fontWeight: FontWeight.normal),
        ),
      ),
      hSpacer(),*/
    ],
  );
}

Widget homeMenu(context, Color bgColor, IconData ic, String title, VoidCallback callback) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: callback,
    child: RoundedContainer(
      containerBGColor: bgColor,
      height: h*0.05,
      width: w * 0.45,
      child: Row(
        children: [
          vSpacer(6),
          Icon(
            ic,
            size: 22,
            color: Colors.white,
          ),
          vSpacer(5),
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.white,),overflow: TextOverflow.ellipsis,
            softWrap: false,),
        ],
      ),
    ),
  );
}

Widget attendanceConditionalMenu(context, Color bgColor, IconData ic, String title, VoidCallback callback) {
  double w = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: callback,
    child: RoundedContainer(
      height: 42,
      child: Center(
        child: Text(title, style: rowDataStyle),

      ),
    ),

  );
}

Widget rowData(context, String title, String value) {
  double w = MediaQuery.of(context).size.width;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: w * 0.35,
        child: MenuThemedText(
          text: title,
          txtColor: Colors.black,
        ),
      ),
      vSpacer(w * 0.05),
      Flexible(
          child: MenuThemedText(
        text: value,
        txtColor: HexColor('193D5B'),
      )),
    ],
  );
}

Widget rowDataForScreen(context, String title, String? value) {
  double w = MediaQuery.of(context).size.width;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: w * 0.35,
        child: MenuThemedText(
          text: title,
          txtColor: Colors.black,
        ),
      ),
      vSpacer(w * 0.05),
      Flexible(
          child: MenuThemedText(
            text: value,
            txtColor: HexColor('193D5B'),
          )),
    ],
  );
}

Widget rowDataWithSno(context, String sno, String title, String value) {
  double w = MediaQuery.of(context).size.width;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: w * 0.25,
        child: MenuThemedText(
          text: sno,
          txtColor: Colors.black,
        ),
      ),
      vSpacer(w * 0.05),
      SizedBox(
        width: w * 0.25,
        child: MenuThemedText(
          text: title,
          txtColor: Colors.black,
        ),
      ),
      vSpacer(w * 0.05),
      Flexible(
          child: MenuThemedText(
        text: value,
        txtColor: HexColor('193D5B'),
      )),
    ],
  );
}

Widget rowDataAReportHead(context, String sno, String title, String value, String status) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: sno, txtColor: HexColor('#72A8D4')))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: title, txtColor: HexColor('#72A8D4')))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: value, txtColor: HexColor('#72A8D4')))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: status, txtColor: HexColor('#72A8D4')))),
    ],
  );
}



Widget rowDataReport(context, String sno, String title, String value, String status) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: sno, txtColor: Colors.black))),
        const VerticalDivider(width: 1, thickness: 1, color: Colors.black),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: title, txtColor: Colors.black))),
        const VerticalDivider(width: 1, thickness: 1, color: Colors.black),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: value, txtColor: Colors.black))),
        const VerticalDivider(width: 1, thickness: 1, color: Colors.black),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: status, txtColor: status.toLowerCase() == 'a' ? Colors.red : HexColor('193D5B')))),
      ],
    ),
  );
}

Widget rowDataMobilePunchReportHead(context, String? empDetails, String date, String? punchTypeName, String? punchTime, String? locationAddress) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: empDetails, txtColor: HexColor('#72A8D4')))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: date, txtColor: HexColor('#72A8D4')))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: punchTypeName, txtColor: HexColor('#72A8D4')))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: punchTime, txtColor: HexColor('#72A8D4')))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              alignment: Alignment.center,
              child: MenuThemedText(text: locationAddress, txtColor: HexColor('#72A8D4')))),
    ],
  );
}

Widget rowDataMobilePunchReport(context, String? empDetails, String date, String? punchTypeName, String? punchTime, String? locationAddress) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: empDetails, txtColor: Colors.black))),
        const VerticalDivider(width: 1, thickness: 1, color: Colors.black),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: date, txtColor: Colors.black))),
        const VerticalDivider(width: 1, thickness: 1, color: Colors.black),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: punchTypeName, txtColor: Colors.black))),
        const VerticalDivider(width: 1, thickness: 1, color: Colors.black),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: punchTime, txtColor: Colors.black))),
        const VerticalDivider(width: 1, thickness: 1, color: Colors.black),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                alignment: Alignment.center,
                child: MenuThemedText(text: locationAddress, txtColor: Colors.black))),
      ],
    ),
  );
}

void showAlertDataSubmit(BuildContext context, String msg, VoidCallback callback) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                callback();
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}

Widget conditionalWidget({required bool isTrue, required Widget first, required Widget second}) {
  return isTrue ? first : second;
}

Widget customTextView(context, String textValue, double size, FontWeight? fontWeight, Color? textColor){
  return Text(textValue, style: TextStyle(fontSize: size, fontWeight: fontWeight, color: textColor));

}

Widget saleReportContainer(context, String ic, String title, String number, VoidCallback callback) {
  return InkWell(
    onTap: callback,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10.0, 25.0, 8.0, 8.0),
          child: RoundedContainer(
            height: 120,
            child: Row(
              children: [
                SizedBox(width: 96, child:  Image.asset(
                  ic,
                  height: 65,
                  width: 65,
                ),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [customTextView(
                      context,
                      title,
                      20,
                      FontWeight.bold,
                      Colors.orange),
                    customTextView(
                        context,
                        number,
                        30,
                        FontWeight.normal,
                        Colors.black87),

                  ],
                )
              ],
            ),
          ),
        ),
   /*     Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 8.0, 8.0),
          child: RoundedContainer(
            height: 120,
            child: Row(
              children: [
                const SizedBox(width: 96, child: Icon(Icons.sd_card_outlined, size:75)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //children: [Text(userData.empName), Text(userData.designation), Text(userData.department)],
                  children: [customTextView(
                      context,
                      'TOTAL SALE AMOUNT',
                      20,
                      FontWeight.bold,
                      Colors.orange),
                    customTextView(
                        context,
                        '7020',
                        30,
                        FontWeight.normal,
                        Colors.black87),

                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 8.0, 8.0),
          child: RoundedContainer(
            height: 120,
            child: Row(
              children: [
                const SizedBox(width: 96, child: Icon(Icons.monetization_on_rounded, size:75)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //children: [Text(userData.empName), Text(userData.designation), Text(userData.department)],
                  children: [customTextView(
                      context,
                      'TOTAL SALE BOOKING',
                      20,
                      FontWeight.bold,
                      Colors.orange),
                    customTextView(
                        context,
                        '6279',
                        30,
                        FontWeight.normal,
                        Colors.black87),

                  ],
                )
              ],
            ),
          ),
        ),*/
      ],
    ),
  );
}



