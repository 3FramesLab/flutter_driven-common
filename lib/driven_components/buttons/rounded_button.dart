part of driven_components_module;

class RoundedButton extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? disabledBackgroundColor;
  final BorderSide? side;
  final TextStyle? buttonTextStyle;

  const RoundedButton({
    required this.onPressed,
    required this.text,
    required this.height,
    required this.backgroundColor,
    required this.foregroundColor,
    this.disabledBackgroundColor = DrivenColors.disabledButtonColor,
    this.side,
    this.buttonTextStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: TextButton(
        onPressed: onPressed,
        style: _style(),
        child: Text(
          text,
          style: buttonTextStyle,
        ),
      ),
    );
  }

  ButtonStyle _style() {
    return RoundedButtonStyle(
      backgroundColor: backgroundColor,
      primary: foregroundColor,
      minimumHeight: height,
      disabledBackgroundColor: disabledBackgroundColor!,
      side: side,
    );
  }
}
