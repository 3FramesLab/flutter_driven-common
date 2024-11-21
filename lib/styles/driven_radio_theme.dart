part of styles_module;

class DrivenRadioTheme {
  static RadioThemeData theme = RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(_fillColor),
  );

  static Color _fillColor(Set<WidgetState> state) {
    if (state.contains(WidgetState.selected) ||
        state.contains(WidgetState.focused)) {
      return DrivenColors.black;
    }
    return DrivenColors.lightestGrey;
  }
}
