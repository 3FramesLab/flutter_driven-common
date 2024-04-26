part of extensions_module;

extension TextSizeWidth on String {
  double textWidth({required TextStyle textStyle}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: this,
        style: textStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width + DrivenDimensions.dp60;
  }
}

extension StringExtensions on String? {
  bool get isNullEmptyOrWhitespace =>
      this == null || this!.isEmpty || this!.trim().isEmpty;

  bool get isNotNullEmptyOrWhitespace => !isNullEmptyOrWhitespace;
}

extension ConvertToDouble on String? {
  double? stringToDouble() => this == null ? null : double.parse(this!);
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
