part of driven_components_module;

class _UnderlinedButtonStyle extends TextStyle {
  const _UnderlinedButtonStyle(Color color,
      {double fontSize = 14, String? fontFamily})
      : super(
          fontSize: fontSize,
          fontWeight: DrivenFonts.fontWeightSemibold,
          color: color,
          decoration: TextDecoration.underline,
          fontFamily: fontFamily ?? DrivenFonts.avertaFontFamily,
        );
}

const _underlinedBlack = _UnderlinedButtonStyle(Colors.black);
const _underlinedPrimary = _UnderlinedButtonStyle(DrivenColors.primary);
const _underlinedWhite = _UnderlinedButtonStyle(Colors.white);
const _underlinedDarkBlue = _UnderlinedButtonStyle(DrivenColors.primary);
const _underlinedBlackf16 = _UnderlinedButtonStyle(Colors.black, fontSize: 16);
const _underlinedWhitef16 = _UnderlinedButtonStyle(Colors.white, fontSize: 16);
const _underlinedDarkBluef16 =
    _UnderlinedButtonStyle(DrivenColors.primary, fontSize: 16);
const _underlinedBlackSfPro = _UnderlinedButtonStyle(Colors.black,
    fontFamily: DrivenFonts.sfProDisplayFontFamily);

class UnderlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle style;

  const UnderlinedButton.black({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedBlack;

  const UnderlinedButton.primary({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedPrimary;

  const UnderlinedButton.white({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedWhite;

  const UnderlinedButton.darkBlue({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedDarkBlue;

  const UnderlinedButton.blackf16({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedBlackf16;

  const UnderlinedButton.whitef16({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedWhitef16;

  const UnderlinedButton.darkBluef16({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedDarkBluef16;

  const UnderlinedButton.blackSfPro({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedBlackSfPro;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Semantics(
        button: true,
        child: Text(text, style: style),
      ),
    );
  }
}
