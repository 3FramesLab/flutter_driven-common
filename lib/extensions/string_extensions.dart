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
