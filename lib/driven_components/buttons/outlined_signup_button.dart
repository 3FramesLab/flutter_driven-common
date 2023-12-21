part of driven_components_module;

class OutlinedSignupButton extends RoundedButton {
  const OutlinedSignupButton({
    required VoidCallback? onPressed,
    required String text,
    super.key,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: DrivenDimensions.buttonHeight,
          backgroundColor: DrivenColors.primaryButtonColor,
          foregroundColor: DrivenColors.primaryButtonTextColor,
          side: const BorderSide(
            width: 2,
            color: DrivenColors.primaryButtonTextColor,
          ),
        );
}
