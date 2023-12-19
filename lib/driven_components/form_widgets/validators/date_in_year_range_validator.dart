part of driven_components_module;

class DateInYearRangeValidator extends Validator {
  final int beforeOffset;
  final int afterOffset;

  const DateInYearRangeValidator(this.beforeOffset, this.afterOffset) : super();

  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    } else {
      return validDateInYearRange(value, beforeOffset, afterOffset);
    }
  }

  @override
  String get failMessage => Validation.mustBeDate;
}
