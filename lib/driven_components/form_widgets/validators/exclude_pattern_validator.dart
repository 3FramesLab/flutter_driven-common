part of driven_components_module;

class ExcludePatternValidator extends Validator {
  final RegExp reg;
  final String errorText;

  const ExcludePatternValidator(this.reg, this.errorText) : super();

  @override
  bool isValid(String? value) {
    return value != null && !reg.hasMatch(value);
  }

  @override
  String get failMessage => errorText;
}
