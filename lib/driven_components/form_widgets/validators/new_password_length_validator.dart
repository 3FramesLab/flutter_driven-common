part of driven_components_module;

class NewPasswordLengthValidator extends Validator {
  @override
  String get failMessage => Validation.newPasswordMustBeLength;

  @override
  bool isValid(String? value) {
    return value != null && value.length >= 12;
  }
}
