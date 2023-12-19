part of driven_components_module;

class RequiredAndNotStartWithZeroValidator extends Validator {
  const RequiredAndNotStartWithZeroValidator() : super();

  @override
  bool isValid(String? value) {
    return value != null && value.trim().isNotEmpty && int.parse(value[0]) != 0;
  }

  @override
  String get failMessage => Validation.requiredAndMustNotStartWithZero;
}
