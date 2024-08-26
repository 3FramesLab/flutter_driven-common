part of driven_components_module;

class DialogButton extends RoundedButton {
  const DialogButton({
    required VoidCallback? onPressed,
    required String text,
    double? height,
    Color? backgroundColor,
    super.key,
  }) : super(
          onPressed: onPressed,
          text: text,
          height: height ?? 42,
          buttonTextStyle: f16SemiBoldWhite,
          backgroundColor: backgroundColor ?? DrivenColors.primaryButtonColor,
          foregroundColor: DrivenColors.primaryButtonTextColor,
        );
}
