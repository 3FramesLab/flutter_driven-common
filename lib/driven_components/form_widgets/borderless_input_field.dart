part of driven_components_module;

class BorderlessInputField extends StatelessWidget {
  final String? placeholderText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? editingController;

  const BorderlessInputField({
    required this.keyboardType,
    this.placeholderText,
    this.onChanged,
    this.hintStyle,
    this.style,
    this.inputFormatters,
    this.editingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: f45RegularBlack.merge(style),
      decoration: BorderlessInputDecoration(
        hintStyle: hintStyle,
        hintText: placeholderText,
      ),
      controller: editingController,
    );
  }
}

class BorderlessInputDecoration extends InputDecoration {
  BorderlessInputDecoration({
    TextStyle? hintStyle,
    String? hintText,
    String counterText = '',
  }) : super(
          hintStyle: f45RegularLightGrey.merge(hintStyle),
          hintText: hintText,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          counterText: counterText,
        );
}
