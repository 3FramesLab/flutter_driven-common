part of driven_components_module;

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onTextChanged;
  final Function()? onSuffixIconPressed;
  final String? Function(String?)? onValidate;
  final bool isObscureText;
  final IconData? suffixIcon;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textInputFormatters;
  final BorderSide? enabledBorder;
  final Widget? suffixImage;
  final TextInputType? keyboardType;
  final int? textMaxLength;
  final TextAlign? textAlign;
  final String? errorText;
  final InputDecoration? inputDecoration;
  final bool? enabled;
  final String? hintText;
  final bool isShowErrorBorder;
  final bool autocorrect;
  final TextCapitalization textCapitalization;

  const CustomTextFormField({
    Key? key,
    this.textEditingController,
    this.onTextChanged,
    this.isObscureText = false,
    this.onValidate,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.focusNode,
    this.textInputFormatters,
    this.enabledBorder,
    this.suffixImage,
    this.keyboardType = TextInputType.text,
    this.textMaxLength,
    this.textAlign = TextAlign.start,
    this.errorText,
    this.inputDecoration,
    this.enabled,
    this.hintText,
    this.isShowErrorBorder = false,
    this.autocorrect = true,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      textField: true,
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: widget.textEditingController,
        onChanged: widget.onTextChanged,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.suffixIcon == Icons.visibility_off_outlined,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: widget.textInputFormatters,
        style: f14SemiboldBlack,
        validator: widget.onValidate,
        decoration: widget.inputDecoration ?? _inputDecoration(),
        maxLength: widget.textMaxLength,
        enabled: widget.enabled,
        textCapitalization: widget.textCapitalization,
        scrollPadding: const EdgeInsets.only(bottom: 80),
        autocorrect: widget.autocorrect,
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      focusColor: DrivenColors.white,
      counterText: '',
      suffixIcon: _suffixWidget(),
      focusedBorder: _focusedBorder(),
      fillColor: DrivenColors.textBackgroundColor,
      filled: true,
      enabledBorder: _focusedBorder(),
      errorText: _errorText(),
      hintText: widget.hintText,
      errorMaxLines: 2,
    );
  }

  Widget? _suffixWidget() {
    return widget.suffixImage == null && widget.suffixIcon != null
        ? _suffixIcon()
        : _suffixImage();
  }

  IconButton _suffixIcon() {
    return IconButton(
      onPressed: widget.onSuffixIconPressed,
      icon: Icon(
        widget.suffixIcon!,
        color: DrivenColors.black54,
      ),
    );
  }

  Widget? _suffixImage() {
    return widget.suffixImage != null && widget.suffixIcon == null
        ? widget.suffixImage
        : const SizedBox();
  }

  String? _errorText() {
    return widget.errorText != null && widget.errorText!.isNotEmpty
        ? widget.errorText
        : null;
  }

  OutlineInputBorder _focusedBorder() {
    return widget.isShowErrorBorder
        ? const OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
        : OutlineInputBorder(
            borderSide: const BorderSide(color: DrivenColors.enableBorderColor),
            borderRadius: BorderRadius.circular(4),
          );
  }
}
