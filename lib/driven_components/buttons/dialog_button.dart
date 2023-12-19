part of driven_components_module;

class DialogButton extends RoundedButton {
  const DialogButton({
    required VoidCallback? onPressed,
    required String text,
    double? height,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: height ?? 42,
          buttonTextStyle: f16SemiBoldWhite,
          backgroundColor: DrivenColors.primaryButtonColor,
          foregroundColor: DrivenColors.primaryButtonTextColor,
        );
}
