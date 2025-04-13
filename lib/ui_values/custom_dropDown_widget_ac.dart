import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomDropDownWidget<T> extends StatelessWidget {
  final ValueChanged<T?>? onChanged;
  final List<T>? dataList;
  final double? fontsize;
  final Color? textcolor;
  final String? fontFamily;
  final T? value;
  final String? hinttext;
  final Widget? icon;
  final TextStyle? hintStyle;
  final Widget? lable;
  final EdgeInsetsGeometry? padding;
  final String Function(T data) item;

  const CustomDropDownWidget(
      {super.key,
      required this.dataList,
      required this.item,
      required this.onChanged,
      this.textcolor,
      this.fontFamily,
      this.fontsize,
      this.hinttext,
      this.padding,
      this.icon,
      this.hintStyle,
      this.lable,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.only(
            left: Get.width / 55,
            right: Get.width / 55,
            top: Get.height / 90,
            bottom: Get.height / 90),
        child: DropdownButton<T>(
          isExpanded: true,
          isDense: true,
          dropdownColor: Colors.white,
          hint: Text(
            hinttext.toString(),
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: hintStyle,
          ),
          underline: Container(),
          icon: icon,
          onChanged: onChanged,
          items: dataList
                  ?.map<DropdownMenuItem<T>>(
                    (e) => DropdownMenuItem<T>(
                      value: e,
                      child: Text(
                        item(e),
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: Get.width>550?Get.height / 70:Get.height / 60,
                            height: 1.0,
                            fontFamily: 'Poppins-Medium'),
                      ),
                    ),
                  )
                  .toList() ??
              [],
        ),
      ),
    );
  }
}
