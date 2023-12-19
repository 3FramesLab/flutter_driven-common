part of driven_components_module;

class DrivenCupertinoSwitch extends CupertinoSwitch {
  const DrivenCupertinoSwitch({
    required super.value,
    required super.onChanged,
    required super.thumbColor,
    Color? activeColor,
    Color? inactiveColor,
    Key? key,
  }) : super(
          activeColor: activeColor,
          trackColor: inactiveColor,
          key: key,
        );
}
