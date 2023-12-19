part of driven_components_module;

class IsEightDigitDateValidator extends Validator {
  const IsEightDigitDateValidator() : super();

  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    } else {
      return validDate(value);
    }
  }

  @override
  String get failMessage => Validation.mustBeDate;
}
