part of driven_components_module;

class EmailSuffixValidator extends Validator {
  final List<String> suffixes;

  EmailSuffixValidator(this.suffixes);

  @override
  String get failMessage => Validation.enterValidEmail;

  @override
  bool isValid(String? value) {
    return value != null &&
        value.isEmail &&
        !suffixes.contains(value.suffix().toLowerCase());
  }
}
