part of driven_components_module;

class HasNDigitsValidator extends Validator {
  final int n;
  final String customErrorMessage;

  const HasNDigitsValidator(this.n, {this.customErrorMessage = ''}) : super();

  @override
  bool isValid(String? value) {
    return value != null && value.removeAllWhitespace.length == n;
  }

  @override
  String get failMessage {
    if (customErrorMessage != '') {
      return Validation.customError(customErrorMessage);
    }
    return Validation.mustBeNDigits(n);
  }
}
