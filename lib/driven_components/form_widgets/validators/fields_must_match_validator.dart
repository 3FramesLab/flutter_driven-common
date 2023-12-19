part of driven_components_module;

class FieldsMustMatchValidator extends Validator {
  final String fieldName;
  final String otherField;

  FieldsMustMatchValidator(this.otherField, {this.fieldName = ''});

  @override
  bool isValid(String? value) {
    return otherField.isEmpty || value == otherField;
  }

  @override
  String get failMessage => Validation.fieldsMustMatch(fieldName);
}
