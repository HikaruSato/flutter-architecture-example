import "package:intl/intl.dart";

extension DateTimeExtension on DateTime {
  bool isAtSameYearMonthDay(DateTime other) {
    if (year != other.year) return false;
    if (month != other.month) return false;
    if (day != other.day) return false;

    return true;
  }

  String formattedString({String format = 'yyyy/MM/dd(E) HH:mm'}) {
    final formatter = DateFormat(format, 'ja_JP');
    final formattedString = formatter.format(this);
    return formattedString;
  }
}
