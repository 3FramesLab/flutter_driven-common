part of driven_components_module;

class PasswordMatchValidator extends Validator {
  final String? password;
  PasswordMatchValidator({this.password});

  @override
  String get failMessage => Validation.passwordsMustMatch;

  @override
  bool isValid(String? value) {
    return value != null && password == value;
  }
}
