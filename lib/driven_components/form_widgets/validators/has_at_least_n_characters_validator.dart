part of driven_components_module;

class HasAtLeastNCharactersValidator extends Validator {
  final int n;

  const HasAtLeastNCharactersValidator(this.n) : super();

  @override
  bool isValid(String? value) {
    return value != null && value.length >= n;
  }

  @override
  String get failMessage => Validation.atLeastNCharacters(n);
}
