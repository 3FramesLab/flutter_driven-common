part of driven_components_module;

class HasNDigitsValidator extends Validator {
  final int n;

  const HasNDigitsValidator(this.n) : super();

  @override
  bool isValid(String? value) {
    return value != null && value.length == n;
  }

  @override
  String get failMessage => Validation.mustBeNDigits(n);
}
