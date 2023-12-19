part of driven_components_module;

class PasswordLengthValidator extends Validator {
  @override
  String get failMessage => Validation.passwordMustBeLength;

  @override
  bool isValid(String? value) {
    return value != null && value.length >= 8;
  }
}
