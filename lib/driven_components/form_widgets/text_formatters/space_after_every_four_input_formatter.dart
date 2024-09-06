part of driven_components_module;

class SpaceAfterEveryFourInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text
        .replaceAll(' ', '')
        .replaceAllMapped(RegExp('.{1,4}'), (match) => '${match.group(0)} ')
        .trim();

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
