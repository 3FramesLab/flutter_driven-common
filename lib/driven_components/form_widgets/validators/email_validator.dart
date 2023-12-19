part of driven_components_module;

class EmailValidator extends Validator {
  const EmailValidator() : super();

  @override
  bool isValid(String? value) {
    return value != null && value.isEmail;
  }

  @override
  String get failMessage => Validation.mustBeValidEmail;
}
