part of driven_components_module;

class DrivenButton extends RoundedButton {
  const DrivenButton({
    required VoidCallback? onPressed,
    required String text,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: DrivenDimensions.buttonHeight,
          backgroundColor: DrivenColors.primaryButtonTextColor,
          foregroundColor: DrivenColors.primaryButtonColor,
        );
}
