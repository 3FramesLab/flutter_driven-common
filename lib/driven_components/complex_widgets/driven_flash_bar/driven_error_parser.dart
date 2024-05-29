part of driven_components_module;

class DrivenErrorParser {
  late final String message;
  late final String code;

  DrivenErrorParser({required String message, required String code}) {
    this.message =
        message.isEmpty ? DrivenConstants.systemErrorAlertMessage : message;
    this.code = code.isEmpty ? '' : '\n${DrivenConstants.errorCodeText}$code';
  }

  List<InlineSpan> parseErrorMessage() {
    return [
      TextSpan(text: message, style: f16SemiBoldWhite),
      _clickablePhoneNumber(),
      const TextSpan(text: '.'),
      TextSpan(text: code, style: f16SemiBoldWhite),
    ];
  }

  TextSpan _clickablePhoneNumber() {
    return TextSpan(
      text: DrivenConstants.helpPhoneNumber,
      recognizer: TapGestureRecognizer()
        ..onTap = () => launchPhoneCall(DrivenConstants.helpPhoneUrl),
      style: f16SemiBoldLinkWhite,
    );
  }
}
