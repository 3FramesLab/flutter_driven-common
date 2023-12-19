part of driven_components_module;

class EmptyCheckValidator extends Validator {
  @override
  String get failMessage => Validation.userNameRequired;

  @override
  bool isValid(String? value) {
    return value != null && value.isNotEmpty;
  }
}
