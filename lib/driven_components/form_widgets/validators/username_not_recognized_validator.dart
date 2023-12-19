part of driven_components_module;

class UserNameNotRecognizedValidator extends Validator {
  final bool? isUserNameNotRecognized;

  const UserNameNotRecognizedValidator({this.isUserNameNotRecognized})
      : super();
  @override
  String get failMessage => Validation.userNameNotRecognized;

  @override
  bool isValid(String? value) {
    return isUserNameNotRecognized != null && isUserNameNotRecognized!;
  }
}
