part of driven_components_module;

class DrivenRadioButton extends StatelessWidget {
  final Widget label;
  final dynamic groupValue;
  final dynamic defaultValue;
  final Function(dynamic) onChange;
  final MaterialTapTargetSize? size;
  final EdgeInsets padding;
  final bool isEnabled;
  final Color? activeColor;

  const DrivenRadioButton({
    required this.label,
    required this.groupValue,
    required this.defaultValue,
    required this.onChange,
    this.isEnabled = true,
    this.activeColor = DrivenColors.primary,
    this.size,
    this.padding = const EdgeInsets.fromLTRB(5, 6, 32, 0),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _bodyContainer(
      children: [
        Transform.scale(
          scale: 1.35,
          child: Radio<dynamic>(
            materialTapTargetSize: size,
            activeColor: DrivenColors.primary,
            value: defaultValue,
            groupValue: groupValue,
            onChanged: isEnabled ? onChange : null,
          ),
        ),
        label,
      ],
    );
  }

  Widget _bodyContainer({required List<Widget> children}) {
    return PaddedRow(
      padding: padding,
      children: children,
    );
  }
}
