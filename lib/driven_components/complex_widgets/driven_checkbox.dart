part of driven_components_module;

class DrivenCheckbox extends StatelessWidget {
  final Function() onTap;
  final Function(bool?)? onChanged;
  final bool value;
  final Widget textWidget;

  const DrivenCheckbox({
    required this.onTap,
    required this.onChanged,
    required this.value,
    required this.textWidget,
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
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return DrivenColors
                    .brandPurple; // Color when checkbox is selected
              }
              return DrivenColors.grey; // Color when checkbox is unselected
            },
          ),
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
