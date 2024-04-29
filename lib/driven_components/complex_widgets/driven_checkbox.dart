part of driven_components_module;

class DrivenCheckbox extends StatelessWidget {
  final Function() onTap;
  final Function(bool?)? onChanged;
  final bool value;
  final Widget textWidget;
  final bool isShowGreyCheckbox;

  const DrivenCheckbox({
    required this.onTap,
    required this.onChanged,
    required this.value,
    required this.textWidget,
    this.isShowGreyCheckbox = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _checkboxContainer(
      [
        _checkbox(),
        const SizedBox(width: 10),
        _checkboxText(),
      ],
    );
  }

  Widget _checkboxContainer(List<Widget> body) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: body,
          ),
        ),
      ],
    );
  }

  Widget _checkbox() {
    return SizedBox(
      height: 24,
      width: 24,
      child: Semantics(
        container: true,
        child: Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: isShowGreyCheckbox
              ? DrivenColors.lighterGreyDisableBackground
              : DrivenColors.brandPurple,
          checkColor: isShowGreyCheckbox
              ? DrivenColors.disabledButtonTextColor
              : DrivenColors.white,
        ),
      ),
    );
  }

  Widget _checkboxText() {
    return Flexible(
      child: Semantics(
        container: true,
        child: textWidget,
      ),
    );
  }
}
