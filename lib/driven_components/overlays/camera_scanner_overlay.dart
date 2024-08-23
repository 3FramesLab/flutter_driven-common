part of driven_components_module;

class CameraScannerOverlay extends StatelessWidget {
  final Widget cameraOverlayLayout;
  final String scannerMessage;
  final String primaryButtonText;
  final Color primaryButtonBackgroundColor;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onBackButtonPressed;
  final Widget? secondaryButtonWidget;

  const CameraScannerOverlay({
    required this.cameraOverlayLayout,
    required this.scannerMessage,
    required this.primaryButtonText,
    required this.onPrimaryButtonPressed,
    required this.onBackButtonPressed,
    this.secondaryButtonWidget,
    this.primaryButtonBackgroundColor = DrivenColors.primaryButtonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cameraOverlayLayout,
        _backButton(context),
        _scannerMessageText(context),
        _addCardNumberManuallyButton,
      ],
    );
  }

  Widget _backButton(BuildContext context) {
    return Padding(
      padding: _backButtonPadding(context),
      child: DrivenBackButton(
        color: DrivenColors.white,
        onPressed: onBackButtonPressed,
      ),
    );
  }

  EdgeInsetsGeometry _backButtonPadding(BuildContext context) {
    return EdgeInsets.only(
      left: 16,
      top: MediaQuery.paddingOf(context).top,
    );
  }

  Widget _scannerMessageText(BuildContext context) {
    return Positioned(
      bottom: (MediaQuery.sizeOf(context).height / 5),
      left: 16,
      right: 16,
      child: Text(
        scannerMessage,
        style: f16SemiBoldWhite.copyWith(
          shadows: const [
            BoxShadow(
              color: Color(0xff000000),
              offset: Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget get _addCardNumberManuallyButton => Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: Column(
          children: [
            PrimaryButton(
              onPressed: onPrimaryButtonPressed,
              text: primaryButtonText,
            ),
            if (secondaryButtonWidget != null) secondaryButtonWidget!
          ],
        ),
      );
}
