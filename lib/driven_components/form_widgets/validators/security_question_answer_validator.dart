part of driven_components_module;

class SecurityQuestionAnswerValidator extends Validator {
  final String message;

  SecurityQuestionAnswerValidator(this.message);

  @override
  String get failMessage => message;

  @override
  bool isValid(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
}
