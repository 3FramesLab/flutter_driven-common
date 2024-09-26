import 'package:flutter/services.dart';

class CapitalizeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Capitalize the new input value
    String capitalizedText = newValue.text.toUpperCase();

    // Return the new text value with cursor position
    return TextEditingValue(
      text: capitalizedText,
      selection: newValue.selection,
    );
  }
}
