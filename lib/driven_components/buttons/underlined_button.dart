part of driven_components_module;

class _UnderlinedButtonStyle extends TextStyle {
  const _UnderlinedButtonStyle(Color color, {double fontSize = 14})
      : super(
          fontSize: fontSize,
          fontWeight: DrivenFonts.fontWeightSemibold,
          color: color,
          decoration: TextDecoration.underline,
        );
}

const _underlinedBlack = _UnderlinedButtonStyle(Colors.black);
const _underlinedPurple = _UnderlinedButtonStyle(DrivenColors.brandPurple);
const _underlinedWhite = _UnderlinedButtonStyle(Colors.white);
const _underlinedBlackf16 = _UnderlinedButtonStyle(Colors.black, fontSize: 16);
const _underlinedWhitef16 = _UnderlinedButtonStyle(Colors.white, fontSize: 16);

class UnderlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle style;

  const UnderlinedButton.black({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedBlack;

  const UnderlinedButton.purple({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedPurple;

  const UnderlinedButton.white({
    required this.onPressed,
    required this.text,
    super.key,
  }) : style = _underlinedWhite;

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

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Semantics(
        label: text,
        button: true,
        child: Text(text, style: style),
      ),
    );
  }
}
