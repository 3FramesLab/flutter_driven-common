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
  final IconData? rightIcon;

  const RoundedButton({
    required this.onPressed,
    required this.text,
    required this.height,
    required this.backgroundColor,
    required this.foregroundColor,
    this.disabledBackgroundColor = DrivenColors.disabledButtonColor,
    this.side,
    this.buttonTextStyle,
    this.rightIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: TextButton(
        onPressed: onPressed,
        style: _style(),
        child: _textWithIcon(),
      ),
    );
  }

  Widget _textWithIcon() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: rightIcon != null ? 32 : 0),
            child: Text(
              text,
              style: buttonTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        rightIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(rightIcon, size: 18),
              )
            : const SizedBox.shrink(),
      ],
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
