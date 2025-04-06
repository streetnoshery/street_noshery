import 'package:intl/intl.dart';

class DateFormatter {
  // Renamed to avoid conflict
  String orderDateFormat(DateTime? time) {
    return DateFormat('dd-MM-yyyy').format(time ?? DateTime.now());
  }

  String stringConvertDateFormat(String? time) {
    if (time == null || time.isEmpty) {
      return '';
    }

    try {
      // Parse the input string to DateTime
      DateTime dateTime = DateTime.parse(time);

      // Format to desired output
      return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
    } catch (e) {
      // If parsing fails, return the original string or empty
      return '';
    }
  }
}
