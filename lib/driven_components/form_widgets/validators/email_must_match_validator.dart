part of driven_components_module;

class EmailMustMatchValidator extends Validator {
  final String? email;
  EmailMustMatchValidator({this.email});

  @override
  String get failMessage => Validation.emailMustMatch;

  @override
  bool isValid(String? value) {
    return value != null && email == value;
  }
}
