part of driven_components_module;

class OutlinedDialogButton extends RoundedButton {
  const OutlinedDialogButton({
    required VoidCallback? onPressed,
    required String text,
    super.key,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: 42,
          backgroundColor: DrivenColors.primaryButtonTextColor,
          foregroundColor: DrivenColors.primaryButtonColor,
          side: const BorderSide(width: 2),
        );
}
