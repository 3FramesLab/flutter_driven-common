part of driven_components_module;

class OutlinedPrimaryButton extends RoundedButton {
  OutlinedPrimaryButton({
    required VoidCallback? onPressed,
    required String text,
    Color backgroundColor = DrivenColors.primaryButtonTextColor,
    Color foregroundColor = DrivenColors.primaryButtonColor,
    Color borderColor = DrivenColors.primaryButtonColor,
    super.key,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: DrivenDimensions.buttonHeight,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: DrivenColors.white,
          foregroundColor: foregroundColor,
          side: BorderSide(
              color: _outlineColor(onPressed, borderColor), width: 2),
        );

  static Color _outlineColor(VoidCallback? onPressed, Color borderColor) {
    return onPressed == null
        ? DrivenColors.disabledButtonTextColor
        : borderColor;
  }
}
