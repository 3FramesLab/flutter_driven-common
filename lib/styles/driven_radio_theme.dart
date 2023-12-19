part of styles_module;

class DrivenRadioTheme {
  static RadioThemeData theme = RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(_fillColor),
  );

  static Color _fillColor(Set<MaterialState> state) {
    if (state.contains(MaterialState.selected) ||
        state.contains(MaterialState.focused)) {
      return DrivenColors.black;
    }
    return DrivenColors.lightestGrey;
  }
}
