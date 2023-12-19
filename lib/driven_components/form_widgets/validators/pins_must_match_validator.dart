part of driven_components_module;

class PinsMustMatchValidator extends Validator {
  final String otherPin;

  PinsMustMatchValidator(this.otherPin);

  @override
  bool isValid(String? value) {
    // Do not display error if the other field hasn't been completed.
    return otherPin.isEmpty || value == otherPin;
  }

  @override
  String get failMessage => Validation.pinsMustMatch;
}
