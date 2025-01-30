part of driven_components_module;

class InlineTextFormField extends StatelessWidget {
  final AutovalidateMode? autovalidateMode;
  final Function(String) onChanged;
  final InputDecoration? decoration;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final int? maxLength;
  final TextStyle style;
  final String title;
  final FormFieldValidator<String>? validator;

  InlineTextFormField({
    required this.onChanged,
    required this.title,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType = TextInputType.name,
    this.hintText,
    this.maxLength,
    this.style = f14RegularBlackDark,
    this.validator,
    InputDecoration? decoration,
    this.inputFormatters,
    super.key,
  }) : decoration = decoration ??
            InlineTextFormFieldDecoration(hintText: hintText, title: title);

  InlineTextFormField.number({
    required this.onChanged,
    required this.title,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.hintText,
    this.maxLength,
    this.style = f14RegularBlackDark,
    this.validator,
    InputDecoration? decoration,
    List<TextInputFormatter>? inputFormatters,
    super.key,
  })  : decoration = decoration ??
            InlineTextFormFieldDecoration(hintText: hintText, title: title),
        keyboardType = TextInputType.number,
        inputFormatters = [
          numericInputFilter,
          ...?inputFormatters,
        ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.fromLTRB(23, 15, 16, 0),
      child: DrivenTextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        style: style,
        decoration: decoration,
        validator: validator,
        autovalidateMode: autovalidateMode,
      ),
    );
  }
}

class InlineTextFormFieldDecoration extends InputDecoration {
  InlineTextFormFieldDecoration({
    required String title,
    String? hintText,
    String? counterText = '',
  }) : super(
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.fromLTRB(6, 11, 6, 6),
          counterText: counterText,
          enabledBorder: InputBorder.none,
          errorBorder: redBorder,
          errorStyle: const TextStyle(height: 0.6),
          focusedErrorBorder: redBorder,
          focusedBorder: InputBorder.none,
          hintStyle: f14RegularLightGrey,
          hintText: hintText,
          isCollapsed: true,
          labelStyle: f14RegularBlackDark,
          prefixIcon: _title(title),
          prefixIconConstraints: const BoxConstraints(maxHeight: 20),
        );

  static OutlineInputBorder redBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red.shade700, width: 2),
  );

  static Widget _title(String title) {
    return Container(
      constraints: const BoxConstraints(minWidth: 70),
      padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
      child: Body1Semibold14Lh23.fixed(title),
    );
  }
}
