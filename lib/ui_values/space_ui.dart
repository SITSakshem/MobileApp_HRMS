import 'package:flutter/material.dart';

vSpacer([double width = 24]) {
  return SizedBox(
    width: width,
  );
}

hSpacer([double height = 24]) {
  return SizedBox(
    height: height,
  );
}

class RoundedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Color? containerBGColor;
  final Color? containerBorderColor;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;

  RoundedContainer(
      {this.height,
      this.width,
      this.child,
      this.containerBGColor,
      this.marginLeft,
      this.marginBottom,
      this.marginRight,
      this.marginTop,
      this.containerBorderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 64,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: marginLeft ?? 8, right: marginRight ?? 8, bottom: marginBottom ?? 8, top: marginTop ?? 8),
        margin: EdgeInsets.only(left: marginLeft ?? 0, right: marginRight ?? 0, bottom: marginBottom ?? 0, top: marginTop ?? 0),
        decoration: BoxDecoration(
          color: containerBGColor ?? Colors.white,
          border: Border.all(
            color: containerBorderColor ?? Colors.grey,
          ),
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child ?? Container(),
            ],
          ),
        ));
  }
}

class RoundedBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Color? containerBGColor;
  final Color? containerBorderColor;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;

  RoundedBox(
      {this.height,
      this.width,
      this.child,
      this.containerBGColor,
      this.marginLeft,
      this.marginBottom,
      this.marginRight,
      this.marginTop,
      this.containerBorderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 38,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: marginLeft ?? 8, right: marginRight ?? 8, bottom: marginBottom ?? 8, top: marginTop ?? 8),
        margin: EdgeInsets.only(left: marginLeft ?? 0, right: marginRight ?? 0, bottom: marginBottom ?? 0, top: marginTop ?? 0),
        decoration: BoxDecoration(
          color: containerBGColor ?? Colors.white,
          border: Border.all(
            color: containerBorderColor ?? Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child ?? Container(),
            ],
          ),
        ));
  }
}
