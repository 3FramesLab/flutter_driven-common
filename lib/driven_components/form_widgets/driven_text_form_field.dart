part of driven_components_module;

class DrivenTextFormField extends TextFormField {
  DrivenTextFormField({
    super.key,
    AutovalidateMode? autovalidateMode,
    TextEditingController? controller,
    InputDecoration? decoration = const InputDecoration(),
    FocusNode? focusNode,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    int? maxLength,
    int? maxLines = 1,
    int? minLines,
    bool obscureText = false,
    ValueChanged<String>? onChanged,
    TextStyle? style,
    FormFieldValidator<String>? validator,
    TextCapitalization textCapitalization = TextCapitalization.none,
    double? bottomScrollPadding = 0,
    bool? enabled = true,
    bool autocorrect = true,
  }) : super(
          autovalidateMode: autovalidateMode,
          controller: controller,
          decoration: decoration,
          focusNode: focusNode,
          initialValue: initialValue,
          inputFormatters: (inputFormatters ?? []) + _universalFormatters(),
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          obscureText: obscureText,
          onChanged: onChanged,
          style: style,
          validator: validator,
          textCapitalization: textCapitalization,
          scrollPadding: EdgeInsets.only(bottom: bottomScrollPadding ?? 0),
          enabled: enabled,
          autocorrect: autocorrect,
          textInputAction: TextInputAction.next,
        );

  static List<TextInputFormatter> _universalFormatters() {
    return [noLeadingSpacesFilter];
  }
}
