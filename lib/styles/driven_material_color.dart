part of styles_module;

@immutable
class DrivenMaterialColor extends WidgetStateProperty<Color?>
    with Diagnosticable {
  final Color? primary;
  final Color? disabled;

  DrivenMaterialColor(this.primary, this.disabled);

  @override
  Color? resolve(Set<WidgetState> states) {
    final isDisabled = states.contains(WidgetState.disabled);
    return isDisabled ? disabled : primary;
  }
}
