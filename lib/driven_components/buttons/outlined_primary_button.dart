part of driven_components_module;

class OutlinedPrimaryButton extends RoundedButton {
  OutlinedPrimaryButton({
    required VoidCallback? onPressed,
    required String text,
    Color backgroundColor = DrivenColors.primaryButtonTextColor,
    Color foregroundColor = DrivenColors.primaryButtonColor,
    Color borderColor = DrivenColors.primaryButtonColor,
    TextStyle? buttonTextStyle,
    double? borderWidth,
    double? borderRadius,
    Widget? prefix,
    super.key,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: DrivenDimensions.buttonHeight,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: DrivenColors.white,
          foregroundColor: foregroundColor,
          side: BorderSide(
              color: _outlineColor(onPressed, borderColor),
              width: borderWidth ?? 2),
          buttonTextStyle: buttonTextStyle,
          borderRadius: borderRadius,
          prefix: prefix,
        );

  static Color _outlineColor(VoidCallback? onPressed, Color borderColor) {
    return onPressed == null
        ? DrivenColors.disabledButtonTextColor
        : borderColor;
  }
}
