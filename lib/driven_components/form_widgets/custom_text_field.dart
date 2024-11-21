part of driven_components_module;

class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onTextChanged;
  final Function()? onSuffixIconPressed;
  final Function()? onEditComplete;
  final bool isObscureText;
  final IconData? suffixIcon;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textInputFormatters;
  final BorderSide? enabledBorder;
  final Image? suffixImage;
  final TextInputType? keyboardType;
  final int? textMaxLength;
  final TextAlign? textAlign;
  final String? errorText;
  final InputDecoration? inputDecoration;
  final String? hintText;
  const CustomTextField({
    Key? key,
    this.textEditingController,
    this.onTextChanged,
    this.onEditComplete,
    this.isObscureText = false,
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
    this.hintText = '',
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.done,
      controller: widget.textEditingController,
      onChanged: widget.onTextChanged,
      onEditingComplete: widget.onEditComplete,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      obscureText: _handleObscureText,
      inputFormatters: widget.textInputFormatters,
      style: f14SemiBoldBlack,
      decoration: widget.inputDecoration ?? _inputDecoration(),
      maxLength: widget.textMaxLength,
    );
  }

  bool get _handleObscureText =>
      widget.suffixIcon == Icons.visibility_off_outlined;

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      counter: const SizedBox.shrink(),
      focusColor: DrivenColors.white,
      fillColor: DrivenColors.pageBackgroundColor,
      suffixIcon: _handleSuffixIcon(),
      focusedBorder: _focusedBorder(),
      enabledBorder: _focusedBorder(),
      errorText: _handleErrorText(),
      hintText: widget.hintText,
    );
  }

  Widget? _handleSuffixIcon() {
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

  String? _handleErrorText() {
    return widget.errorText != null && widget.errorText!.isNotEmpty
        ? widget.errorText
        : null;
  }

  OutlineInputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: DrivenColors.enableBorderColor),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
