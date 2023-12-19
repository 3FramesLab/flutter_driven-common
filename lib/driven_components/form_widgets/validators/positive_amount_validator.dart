part of driven_components_module;

class PositiveAmountValidator extends Validator {
  const PositiveAmountValidator() : super();

  @override
  bool isValid(String? value) {
    return value != null && MoneyMaker.fromString(value).isPositive;
  }

  @override
  String get failMessage => Validation.greaterThan(0);
}
