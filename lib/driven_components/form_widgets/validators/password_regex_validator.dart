part of driven_components_module;

class PasswordRegexValidator extends Validator {
  @override
  String get failMessage => Validation.mustMeetPasswordFormatRules;

  @override
  bool isValid(String? value) {
    return value != null &&
        RegexGenerator.generateRegExp(DrivenConstants.passwordRegex)
            .hasMatch(value);
  }
}
