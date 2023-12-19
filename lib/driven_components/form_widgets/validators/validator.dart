part of driven_components_module;

abstract class Validator {
  const Validator();

  bool isValid(String? value);
  String get failMessage;
}
