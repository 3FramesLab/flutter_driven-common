part of driven_components_module;

class BusinessNameComdataValidator extends Validator {
  const BusinessNameComdataValidator() : super();

  @override
  bool isValid(String? value) {
    return value != null && RegExp(r'(^[a-zA-Z ]*$)').hasMatch(value);
  }

  @override
  String get failMessage => Validation.specialCharsAndNumbersNotAllowed2;
}
