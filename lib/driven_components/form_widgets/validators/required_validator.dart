part of driven_components_module;

class RequiredValidator extends Validator {
  const RequiredValidator() : super();

  @override
  bool isValid(String? value) {
    return value != null && value.isNotEmpty;
  }

  @override
  String get failMessage => Validation.required;
}
