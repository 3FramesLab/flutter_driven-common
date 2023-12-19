part of driven_components_module;

mixin HasValidation {
  List<Validator> get validators;

  String? validate(String? value) {
    for (final Validator validator in validators) {
      if (!validator.isValid(value)) {
        return validator.failMessage;
      }
    }
    return null;
  }
}
