part of driven_components_module;

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onTextChanged;
  final Function()? onEditComplete;
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
  final String titleText;
  final String? hintText;
  final TextStyle hintStyle;
  final String? semanticLabel;
  final bool isShowErrorBorder;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final Color fillColor;
  final Color? suffixIconColor;
  final bool autoFocus;
  final bool enableSuggestions;
  final bool showSuccessBorder;
  final bool readOnly;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? style;

  const CustomTextFormField({
    Key? key,
    this.textEditingController,
    this.onTextChanged,
    this.onEditComplete,
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
    this.titleText = '',
    this.hintText,
    this.isShowErrorBorder = false,
    this.autocorrect = true,
    this.semanticLabel = 'InputText',
    this.textCapitalization = TextCapitalization.none,
    this.fillColor = DrivenColors.textBackgroundColor,
    this.suffixIconColor = DrivenColors.black,
    this.autoFocus = false,
    this.enableSuggestions = true,
    this.showSuccessBorder = false,
    this.readOnly = false,
    this.hintStyle = f14RegularLightGrey,
    this.labelStyle,
    this.errorStyle,
    this.style,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return widget.titleText.isNotNullEmptyOrWhitespace
        ? _labelWithTextFormField()
        : _textFormField();
  }

  Widget _labelWithTextFormField() {
    return SizedBox(
      child: Column(
        children: [
          _label(),
          const SizedBox(height: 10),
          _textFormField(),
        ],
      ),
    );
  }

  Semantics _textFormField() {
    return Semantics(
      label: widget.semanticLabel,
      value: widget.semanticLabel,
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: widget.textEditingController,
        onChanged: widget.onTextChanged,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.suffixIcon == Icons.visibility_off_outlined,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: widget.textInputFormatters,
        style: widget.style ?? f14SemiboldBlack,
        validator: widget.onValidate,
        decoration: widget.inputDecoration ?? _inputDecoration(),
        maxLength: widget.textMaxLength,
        enabled: widget.enabled,
        autofocus: widget.autoFocus,
        textCapitalization: widget.textCapitalization,
        scrollPadding: const EdgeInsets.only(bottom: 80),
        autocorrect: widget.autocorrect,
        onEditingComplete: widget.onEditComplete,
        enableSuggestions: widget.enableSuggestions,
        readOnly: widget.readOnly,
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      focusColor: DrivenColors.white,
      counterText: '',
      suffixIcon: _suffixWidget(),
      focusedBorder: _focusedBorder(),
      fillColor: widget.fillColor,
      filled: true,
      enabledBorder: _focusedBorder(),
      errorText: _errorText(),
      errorStyle: widget.errorStyle,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
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
        color: widget.suffixIconColor,
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
    if (widget.showSuccessBorder) {
      return const OutlineInputBorder(
        borderSide: BorderSide(
          color: DrivenColors.green,
        ),
      );
    } else {
      return widget.isShowErrorBorder
          ? const OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
          : OutlineInputBorder(
              borderSide:
                  const BorderSide(color: DrivenColors.enableBorderColor),
              borderRadius: BorderRadius.circular(4),
            );
    }
  }

  Widget _label() {
    return Semantics(
      container: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.titleText, style: widget.labelStyle ?? f14SemiboldGrey),
        ],
      ),
    );
  }
}
