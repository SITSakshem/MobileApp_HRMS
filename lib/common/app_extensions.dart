import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntExtensions on int {
  String getLeaveStatus() {
    String status = "Unknown";
    switch (this) {
      case 0:
        status = "Pending";
        break;
      case 1:
        status = "Approve";
        break;
      case 2:
        status = "Reject";
        break;
      default:
        status = "InProcess";
    }
    return status;
  }

  String getPrefix() {
    return (this < 10) ? "0$this" : "$this";
  }
}

extension TimeOfDayExtensions on TimeOfDay {
  String getFormattedTime() {
    String hour = this.hour.getPrefix();
    String minutes = minute.getPrefix();
    return "$hour:$minutes:00";
  }
}

extension StringExtensions on String {
  String toDateString() {
    DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
    return dateFormatter.format(DateTime.parse(this));
  }

  DateTime toDate({String format = "yyyy-MM-dd'T'HH:mm:ss"}) {
    DateFormat dateFormatter = DateFormat(format);
    return dateFormatter.parse(this);
  }
}