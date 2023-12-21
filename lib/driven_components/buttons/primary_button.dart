part of driven_components_module;

class PrimaryButton extends RoundedButton {
  const PrimaryButton({
    required VoidCallback? onPressed,
    required String text,
    Color backgroundColor = DrivenColors.primaryButtonColor,
    Color foregroundColor = DrivenColors.primaryButtonTextColor,
    super.key,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: 48,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        );
}
