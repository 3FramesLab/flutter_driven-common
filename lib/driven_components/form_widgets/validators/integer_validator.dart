part of driven_components_module;

class IntegerValidator extends Validator {
  const IntegerValidator() : super();

  @override
  bool isValid(String? value) {
    return value != null && int.tryParse(value) != null;
  }

  @override
  String get failMessage => Validation.mustBeNumber;
}
