part of driven_components_module;

class MustEqualDeleteValidator extends Validator {
  const MustEqualDeleteValidator() : super();

  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    } else {
      return value.toLowerCase() == 'delete';
    }
  }

  @override
  String get failMessage => Validation.mustEqualDelete;
}
