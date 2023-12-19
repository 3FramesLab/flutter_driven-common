part of driven_components_module;

class IsMonthYearDateValidator extends Validator {
  const IsMonthYearDateValidator() : super();

  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    }
    final int monthVal = int.parse(value.substring(0, 2));
    final int yearVal = int.parse(value.substring(2)) + 2000;
    return (monthVal >= 1 && monthVal <= 12) &&
        cardExpireDateCheck(monthVal, yearVal);
  }

  @override
  String get failMessage => Validation.mustBeDate;
}
