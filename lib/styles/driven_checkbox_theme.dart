part of styles_module;

class DrivenCheckboxTheme {
  static CheckboxThemeData theme = CheckboxThemeData(
    fillColor: MaterialStateColor.resolveWith(_fillColor),
    checkColor: MaterialStateColor.resolveWith((states) => Colors.white),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(2),
      ),
    ),
    side: const BorderSide(),
  );

  static Color _fillColor(Set<MaterialState> state) {
    if (state.contains(MaterialState.selected) ||
        state.contains(MaterialState.focused)) {
      return DrivenColors.black;
    }
    return Colors.white;
  }
}
