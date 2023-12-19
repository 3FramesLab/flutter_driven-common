part of driven_components_module;

class CardNumberCharactersValidator extends Validator {
  final int n;

  const CardNumberCharactersValidator(this.n) : super();

  @override
  bool isValid(String? value) {
    return value != null && value.length >= n;
  }

  @override
  String get failMessage => Validation.atLeastNCharacters(16);
}
