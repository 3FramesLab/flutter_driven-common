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

// shortDate function will return this format: Jan 31, 2020
String shortDate(String dateString) {
  final DateTime? date = parseToDate(dateString);
  return date != null ? DateFormat.yMMMd().format(date) : '';
}

// utility core validations / formatters

DateTime? parseToDate(String dateString) {
  try {
    return _parseMMddyDashFormat(dateString) ??
        _parseMMddySlashFormat(dateString);
  } catch (_) {
    return null;
  }
}

DateTime? _parseMMddyDashFormat(String dateString) {
  try {
    return DateFormat('MM-dd-y').parse(dateString);
  } catch (_) {
    return null;
  }
}

DateTime? _parseMMddySlashFormat(String dateString) {
  try {
    return DateFormat('MM/dd/y').parse(dateString);
  } catch (_) {
    return null;
  }
}

int getTimeDiff(int timeStampStored, {TimeDiffUnits? unit}) {
  final int lastTimeStored = timeStampStored;
  final int todayTimeStamp = DateTime.now().millisecondsSinceEpoch;
  final lastTimeStoredDate =
      DateTime.fromMillisecondsSinceEpoch(lastTimeStored);
  final todayDate = DateTime.fromMillisecondsSinceEpoch(todayTimeStamp);
  int difference = todayDate.difference(lastTimeStoredDate).inMinutes;
  if (unit != null && unit == TimeDiffUnits.days) {
    difference = todayDate.difference(lastTimeStoredDate).inDays;
  } else if (unit != null && unit == TimeDiffUnits.hours) {
    difference = todayDate.difference(lastTimeStoredDate).inHours;
  } else if (unit != null && unit == TimeDiffUnits.seconds) {
    difference = todayDate.difference(lastTimeStoredDate).inSeconds;
  } else if (unit != null && unit == TimeDiffUnits.milliseconds) {
    difference = todayDate.difference(lastTimeStoredDate).inMilliseconds;
  }
  return difference;
}

enum TimeDiffUnits {
  days,
  minutes,
  hours,
  seconds,
  milliseconds,
}

String convertHrsToAmPm(String text) {
  return DateFormat('hh a').format(DateFormat('HH:mm').parse(text));
}
