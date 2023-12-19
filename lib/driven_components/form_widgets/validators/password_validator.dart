part of driven_components_module;

class PasswordValidator extends Validator {
  final String? firstName;
  final String? lastName;
  PasswordValidator({this.firstName, this.lastName});

  @override
  String get failMessage => Validation.mustMeetPasswordFormatRules;

  @override
  bool isValid(String? value) {
    return value != null &&
        RegexGenerator.generateRegExp(DrivenConstants.passwordRegex)
            .hasMatch(value) &&
        !value.contains(firstName ?? '') &&
        !value.contains(lastName ?? '');
  }
}
