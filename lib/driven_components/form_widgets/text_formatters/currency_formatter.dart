part of driven_components_module;

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // // max 999,999.99
    if (newValue.text.length > 8) {
      return oldValue;
    }
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final money = MoneyMaker.fromInt(int.parse(newValue.text));
    final formattedMoney = money.signlessString();

    return newValue.copyWith(
        text: formattedMoney,
        selection: TextSelection.collapsed(offset: formattedMoney.length));
  }
}
