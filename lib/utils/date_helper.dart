part of utils_module;

final usDateFormatter = DateFormat('MM/dd/yyyy');

final usMonthWordDateFormatter = DateFormat('MMMM dd, yyyy');

DateTime now() {
  return DateTime.now();
}

DateTime daysAgo(int days) {
  return now().subtract(Duration(days: days));
}

String nowDateString() {
  return usDateFormatter.format(now());
}

String usdToLongMonthDateString(String date) {
  final dateTime = DateFormat.yMd('en_US').parse(date);
  return usMonthWordDateFormatter.format(dateTime);
}

String daysAgoDateString(int days) {
  return usDateFormatter.format(daysAgo(days));
}

bool validDate(String date) {
  return stringToDateTime(date) != null;
}

bool validDateInYearRange(String date, int beforeOffset, int afterOffset) {
  final formattedDate = stringToDateTime(date);
  if (formattedDate == null) {
    return false;
  }
  return isDateBetween(
    formattedDate,
    yearsAgo(beforeOffset),
    yearsAgo(afterOffset),
  );
}

DateTime yearsAgo(int years) {
  final now = DateTime.now();
  return DateTime(now.year - years, now.month, now.day);
}

bool isDateBetween(DateTime date, DateTime before, DateTime after) {
  return date.isBefore(before) && date.isAfter(after);
}

DateTime? stringToDateTime(String date) {
  try {
    return DateFormat('yMd').parseStrict(date);
  } on FormatException catch (_) {
    return null;
  }
}

bool cardExpireDateCheck(int month, int year) {
  final now = DateTime.now();
  final expirationDate = DateTime(year, month + 1);
  return expirationDate.isAfter(now);
}

String notificationDate(DateTime dateTime) {
  return DateFormat('MM/dd/yyyy hh:mm a').format(dateTime);
}
