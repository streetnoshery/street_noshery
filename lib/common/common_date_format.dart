import 'package:intl/intl.dart';

class DateFormatter { // Renamed to avoid conflict
  String orderDateFormat(DateTime? time) {
    return DateFormat('dd-MM-yyyy').format(time ?? DateTime.now());
  }
}