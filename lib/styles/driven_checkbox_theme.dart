part of styles_module;

class DrivenCheckboxTheme {
  static CheckboxThemeData theme = CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith(_fillColor),
    checkColor: WidgetStateColor.resolveWith((states) => Colors.white),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(2),
      ),
    ),
    side: const BorderSide(),
  );

  static Color _fillColor(Set<WidgetState> state) {
    if (state.contains(WidgetState.selected) ||
        state.contains(WidgetState.focused)) {
      return DrivenColors.primary;
    }
    return Colors.white;
  }
}
