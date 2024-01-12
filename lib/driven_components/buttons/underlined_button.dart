part of driven_components_module;

class _UnderlinedButtonStyle extends TextStyle {
  const _UnderlinedButtonStyle(Color color)
      : super(
          fontSize: 14,
          fontWeight: DrivenFonts.fontWeightSemibold,
          color: color,
          decoration: TextDecoration.underline,
        );
}

const _underlinedBlack = _UnderlinedButtonStyle(Colors.black);
const _underlinedPurple = _UnderlinedButtonStyle(DrivenColors.brandPurple);
const _underlinedWhite = _UnderlinedButtonStyle(Colors.white);

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

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: style),
    );
  }
}
