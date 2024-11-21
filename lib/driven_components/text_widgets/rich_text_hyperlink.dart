part of driven_components_module;

TextSpan richTextHyperlink(String hyperlinkText, VoidCallback action) {
  return TextSpan(
    text: hyperlinkText,
    style: const TextStyle(
      color: DrivenColors.primary,
      decoration: TextDecoration.underline,
      fontWeight: DrivenFonts.fontWeightSemibold,
      fontSize: 12,
    ),
    recognizer: TapGestureRecognizer()..onTap = action,
  );
}
