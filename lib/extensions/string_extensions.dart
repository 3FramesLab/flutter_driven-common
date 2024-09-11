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

  bool isValidCardNumber([int expectedLength = 16]) {
    return isNotNullEmptyOrWhitespace &&
        RegExp(r'^\d{' + expectedLength.toString() + r'}$').hasMatch(this!);
  }

  bool validateCardBinNumber(List<String> cardBinWhiteList) {
    if (isNullEmptyOrWhitespace) {
      return false;
    }
    bool isValid = true;
    if (cardBinWhiteList.isNotEmpty) {
      // RegExp(r'^55673\d{11}$')

      for (int i = 0; i < cardBinWhiteList.length; i++) {
        int prefixLength = cardBinWhiteList[i].length;
        if (RegExp('^${cardBinWhiteList[i]}'
                r'\d{'
                '${(16 - prefixLength).toString()}'
                r'}$')
            .hasMatch(this!)) {
          isValid = true;
          break;
        } else {
          isValid = false;
        }
      }
    }

    if (!isValid) {
      return false;
    }

    int sum = 0;
    bool doubleDigit = false;

    // Iterate through the card number from right to left
    for (int i = this!.length - 1; i >= 0; i--) {
      int digit = int.parse(this![i]);
      if (doubleDigit) {
        digit = digit * 2;
        digit = digit > 9 ? digit - 9 : digit;
      }

      sum += digit;
      doubleDigit = !doubleDigit;
    }

    return sum % 10 == 0;
  }
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

  String suffix() => split('.').last;
}
