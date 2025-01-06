part of driven_components_module;

class PrimaryButton extends RoundedButton {
  const PrimaryButton({
    required VoidCallback? onPressed,
    required String text,
    TextStyle? buttonTextStyle,
    Color backgroundColor = DrivenColors.primaryButtonColor,
    Color foregroundColor = DrivenColors.primaryButtonTextColor,
    double? borderRadius,
    Widget? prefix,
    super.key,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: 48,
          buttonTextStyle: buttonTextStyle,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          borderRadius: borderRadius,
          prefix: prefix,
        );
}
