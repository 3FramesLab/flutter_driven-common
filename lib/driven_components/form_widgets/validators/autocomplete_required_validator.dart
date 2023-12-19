part of driven_components_module;

class AutoCompleteRequiredValidator extends Validator {
  final String validateField;
  final String validationMessage;

  const AutoCompleteRequiredValidator({
    required this.validateField,
    required this.validationMessage,
  }) : super();

  @override
  bool isValid(String? value) {
    return validateField.isNotEmpty;
  }

  @override
  String get failMessage => validationMessage;
}
