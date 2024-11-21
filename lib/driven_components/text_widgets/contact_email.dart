part of driven_components_module;

TextSpan contactEmail(Color textColor) {
  return TextSpan(
    text: DrivenConstants.contactEmail,
    style: f14SemiBoldBlack2.copyWith(
      color: textColor,
      decoration: TextDecoration.underline,
      height: 1.6,
      letterSpacing: 0.1,
    ),
    recognizer: _showEmailPopUp(),
  );
}

TapGestureRecognizer _showEmailPopUp() {
  return TapGestureRecognizer()
    ..onTap = () async {
      await _makeTapActionForEmail();
    };
}

Future<void> _makeTapActionForEmail() async {
  final Uri emailUrl = Uri(
    scheme: 'mailto',
    path: DrivenConstants.contactEmail,
    query: '', //add subject and body here
  );
  await launchUrl(emailUrl);
}
