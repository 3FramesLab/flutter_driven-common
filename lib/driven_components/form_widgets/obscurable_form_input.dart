part of driven_components_module;

class ObscurableFormInput extends StatefulWidget {
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String titleText;
  final String placeholderText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? rightSlot;
  final String? initialValue;

  const ObscurableFormInput({
    required this.titleText,
    required this.placeholderText,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.rightSlot,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  State<ObscurableFormInput> createState() => _ObscurableFormInputState();
}

class _ObscurableFormInputState extends State<ObscurableFormInput> {
  bool isFieldHidden = true;

  @override
  Widget build(BuildContext context) {
    return FormInput(
      titleText: widget.titleText,
      placeholderText: widget.placeholderText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      suffixIcon: _hiddenIconButton(),
      obscureText: isFieldHidden,
      rightSlot: widget.rightSlot,
      key: widget.key,
      initialValue: widget.initialValue,
    );
  }

  Widget _hiddenIconButton() {
    return HiddenIconButton(
      isHidden: isFieldHidden,
      onPressed: _toggleHideField,
    );
  }

  void _toggleHideField() {
    setState(() {
      isFieldHidden = !isFieldHidden;
    });
  }
}
