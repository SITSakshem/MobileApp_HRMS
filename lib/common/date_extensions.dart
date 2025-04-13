
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toDateString({String format = "dd-MMM-yyyy"}) {
    DateFormat dateFormatter = DateFormat(format);
    return dateFormatter.format(this);
  }

  DateTime toEndOfMonth() {
    // Create a DateTime object for the first day of next month
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);
    // Subtract one day to get the last day of the current month
    DateTime lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));
    return lastDayOfMonth;
  }

  DateTime toStartOfMonth() {
    return DateTime(year, month, 1);
  }
}