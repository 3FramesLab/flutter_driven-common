part of driven_components_module;

class EmailValidators extends Validator {
  @override
  String get failMessage => Validation.enterValidEmail;

  @override
  bool isValid(String? value) {
    return value != null && value.isEmail;
  }
}
