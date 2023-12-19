part of driven_components_module;

class BusinessNameValidator extends Validator {
  const BusinessNameValidator() : super();

  @override
  bool isValid(String? value) {
    return value != null && RegExp(r'(^[a-zA-Z0-9 ]*$)').hasMatch(value);
  }

  @override
  String get failMessage => Validation.specialCharsNotAllowed;
}
