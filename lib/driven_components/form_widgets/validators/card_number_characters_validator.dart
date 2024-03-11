part of driven_components_module;

class CardNumberCharactersValidator extends Validator {
  final int n;
  final int propCardLength;

  const CardNumberCharactersValidator(this.n, this.propCardLength) : super();

  @override
  bool isValid(String? value) {
    if (value != null) {
      return value.length == propCardLength || value.length >= n;
    }
    return false;
  }

  @override
  String get failMessage => Validation.notValidCardNumber;
}
