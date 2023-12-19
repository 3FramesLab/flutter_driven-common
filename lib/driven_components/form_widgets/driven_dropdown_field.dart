part of driven_components_module;

class DrivenDropdownField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String?>? onChanged;
  final List<String> options;
  final String? value;

  const DrivenDropdownField({
    required this.hintText,
    required this.onChanged,
    required this.options,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: _interiorPadding(),
      hint: Body1Regular14(hintText, style: _greyBlueStyle()),
      items: _items(),
      isExpanded: true,
      onChanged: onChanged,
      value: value,
    );
  }

  TextStyle _greyBlueStyle() {
    return const TextStyle(color: DrivenColors.greyBlue);
  }

  InputDecoration _interiorPadding() {
    return const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    );
  }

  List<DropdownMenuItem<String>> _items() {
    return options
        .map<DropdownMenuItem<String>>(
            (val) => DropdownMenuItem(value: val, child: Body1Regular14(val)))
        .toList();
  }
}
