part of driven_components_module;

class ContainSpaceValidator extends Validator {
  @override
  String get failMessage => Validation.spacesNotAllowed;

  @override
  bool isValid(String? value) {
    return value != null && !value.contains(' ');
  }
}
