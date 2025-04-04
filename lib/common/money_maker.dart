// part of common_module;

import 'package:money2/money2.dart';

class MoneyMaker {
  static Money fromIconnect(String amount) {
    final lengthAfterDecimal = amount.length - 1 - amount.indexOf('.');
    final parsed = lengthAfterDecimal == 1 ? '${amount}0' : amount;
    final cents = parsed.replaceAll(RegExp('[^0-9-]'), '');
    final amountInCents = cents.isEmpty ? 0 : int.parse(cents);
    return fromInt(amountInCents);
  }

  static Money fromInt(int amountInCents) {
    return Money.fromInt(amountInCents, code: 'USD');
  }

  static Money fromString(String amount) {
    return fromIconnect(amount);
  }
}

extension CustomMoney on Money {
  String cents() {
    return format('.00');
  }

  String dollars() {
    return format('S###,##0');
  }

  String signlessString() {
    return format('###,##0.00');
  }

  String iconnectString() {
    return format('#0.00');
  }
}
