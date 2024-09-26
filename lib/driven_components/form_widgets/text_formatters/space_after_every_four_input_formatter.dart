part of driven_components_module;

class SpaceAfterEveryFourInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(' ', '');
    int selectionIndex = newValue.selection.end;
    String formattedText = '';
    int nonSpaceCount = 0;

    for (int i = 0; i < newText.length; i++) {
      if (nonSpaceCount > 0 && nonSpaceCount % 4 == 0) {
        formattedText += ' ';
        if (i < selectionIndex) {
          selectionIndex++;
        }
      }

      formattedText += newText[i];
      nonSpaceCount++;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
