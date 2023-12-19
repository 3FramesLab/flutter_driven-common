part of driven_components_module;

class SwitchWithContainer extends StatelessWidget {
  const SwitchWithContainer({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ToggleSwitchContainer(
          child: DrivenCupertinoSwitch(
        value: value,
        activeColor: DrivenColors.flashGreen,
        inactiveColor: Colors.white,
        thumbColor: value ? Colors.white : Colors.grey,
        key: const Key(DrivenConstants.saveUserNameSwitchKey),
        onChanged: onChanged,
      )),
    );
  }
}
