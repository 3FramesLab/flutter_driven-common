part of extensions_module;

extension TruncateDoubles on double {
  double truncateToDecimalPlaces(int fractionalDigits) =>
      (this * pow(10, fractionalDigits)).truncate() / pow(10, fractionalDigits);

  String truncateDecimalsToString(int fractionalDigits) =>
      truncateToDecimalPlaces(fractionalDigits).toStringAsFixed(2);
}

extension DateTimeDiffInHours on String {
  int getDiffHoursBetweenDates(String currentDateTime) {
    final storedDate = DateTime.parse(this);
    final from = DateTime(
      storedDate.year,
      storedDate.month,
      storedDate.day,
      storedDate.hour,
      storedDate.minute,
      storedDate.second,
    );
    final to = DateTime.parse(currentDateTime);

    return to.difference(from).inHours;
  }
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from < this && this < to;
  }
}
