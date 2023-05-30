import 'package:intl/intl.dart';

String dateToString({
  dynamic date,
  String from = 'yyyy-MM-dd HH:mm',
  String to = 'EEE, dd MMM',
}) {
  try {
    DateTime res = DateTime.now();

    if (date is String) {
      DateFormat format = DateFormat(from, 'en_US');
      res = format.parse(date);
    } else if (date == null) {
      res = DateTime.now();
    } else if (date is DateTime) {
      res = date;
    }

    final DateFormat formatter = DateFormat(to);
    return formatter.format(res);
  } catch (e) {
    return date;
  }
}

///[String] to [DateTime]
DateTime stringToDate({
  required String date,
  String from = 'yyyy-MM-dd HH:mm',
  int utc = 5,
}) {
  DateTime res = DateFormat(from, 'en_US').parse(date);
  return res.add(Duration(hours: utc));
}
