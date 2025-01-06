part of styles_module;

@immutable
class DrivenMaterialColor extends MaterialStateProperty<Color?>
    with Diagnosticable {
  final Color? primary;
  final Color? disabled;

  DrivenMaterialColor(this.primary, this.disabled);

  @override
  Color? resolve(Set<MaterialState> states) {
    final isDisabled = states.contains(MaterialState.disabled);
    return isDisabled ? disabled : primary;
  }
}
