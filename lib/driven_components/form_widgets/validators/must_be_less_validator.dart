part of driven_components_module;

class MustBeLessValidator extends Validator {
  final int n;

  const MustBeLessValidator(this.n) : super();

  @override
  bool isValid(String? value) {
    if (value == null) {
      return false;
    }

    final val = int.tryParse(value);
    return val != null && val <= n;
  }

  @override
  String get failMessage => Validation.mustBeNOrLess(n);
}
