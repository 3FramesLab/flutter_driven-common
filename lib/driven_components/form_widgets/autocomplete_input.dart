part of driven_components_module;

class AutoCompleteInput<T extends NameIdObject> extends StatelessWidget
    with HasValidation {
  final List<T> options;
  final void Function(T) onSelected;
  final void Function(String) onClear;
  final String hintText;
  final String label;
  final double height;
  final String initialValue;
  final String validationField;
  final String validationMessage;
  final bool isDefaultValueRequired;
  final int maxLength;
  final bool allowMaxLength;

  const AutoCompleteInput({
    required this.options,
    required this.onSelected,
    required this.onClear,
    required this.validationField,
    required this.validationMessage,
    required this.hintText,
    required this.label,
    this.height = 115,
    this.initialValue = '',
    this.isDefaultValueRequired = false,
    this.maxLength = 30,
    this.allowMaxLength = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _bodyContainer(
      children: [
        _label(),
        const SizedBox(height: 10),
        Autocomplete<T>(
          fieldViewBuilder: _viewBuilder,
          displayStringForOption: (option) => option.name,
          optionsBuilder: _optionsBuilder,
          onSelected: onSelected,
          initialValue: TextEditingValue(text: initialValue),
        ),
      ],
    );
  }

  Widget _bodyContainer({required List<Widget> children}) {
    return SizedBox(
      height: height,
      child: Column(
        children: children,
      ),
    );
  }

  Widget _viewBuilder(
    context,
    TextEditingController textEditingController,
    focusNode,
    onFieldSubmitted,
  ) {
    return DrivenTextFormField(
      maxLength: allowMaxLength ? maxLength : null,
      controller: textEditingController,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      style: const TextStyle(fontSize: 14),
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onClear,
      bottomScrollPadding: DrivenDimensions.bottomScrollPadding,
    );
  }

  Iterable<T> _optionsBuilder(textEditingValue) {
    if (textEditingValue.text == '') {
      return Iterable<T>.empty();
    }
    return options.where((option) {
      if (isDefaultValueRequired) {
        return option.name
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()) ||
            option.id
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()) ||
            option.name
                .toLowerCase()
                .contains(DrivenConstants.other.toLowerCase()) ||
            option.id
                .toLowerCase()
                .contains(DrivenConstants.other.toLowerCase());
      }
      return option.name
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()) ||
          option.id.toLowerCase().contains(textEditingValue.text.toLowerCase());
    });
  }

  Widget _label() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: f14SemiboldGrey,
        ),
      ],
    );
  }

  @override
  List<Validator> get validators => [
        AutoCompleteRequiredValidator(
          validateField: validationField,
          validationMessage: validationMessage,
        ),
      ];
}
