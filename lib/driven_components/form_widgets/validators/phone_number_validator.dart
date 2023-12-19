part of driven_components_module;

class PhoneNumberValidator extends Validator {
  @override
  String get failMessage => Validation.enterValidPhoneNumber;

  @override
  bool isValid(String? value) {
    return value != null && value.isNotEmpty && value.length == 12;
  }
}
