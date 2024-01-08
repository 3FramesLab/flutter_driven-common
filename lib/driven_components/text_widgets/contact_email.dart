part of driven_components_module;

TextSpan contactEmail(Color textColor) {
  return TextSpan(
    text: DrivenConstants.contactEmail,
    style: f14SemiboldBlack2.copyWith(
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
  final Uri params = Uri(
    scheme: 'mailto',
    path: DrivenConstants.contactEmail,
    query: '', //add subject and body here
  );

  final url = params.toString();
  if (await safeLaunchAsync(
    DrivenConstants.canLaunchEmail,
    tryAction: () => canLaunchUrlString(url),
    catchAction: () => Future.value(false),
  )) {
    await safeLaunchAsync(
      DrivenConstants.launchEmail,
      tryAction: () => launchUrlString(url),
      catchAction: () => Future.value(false),
    );
  }
}
