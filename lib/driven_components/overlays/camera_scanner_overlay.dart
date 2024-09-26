// ignore_for_file: must_be_immutable

part of driven_components_module;

class CameraScannerOverlay extends StatelessWidget {
  final Widget cameraOverlayLayout;
  final String scannerMessage;
  final String primaryButtonText;
  final Color primaryButtonBackgroundColor;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onBackButtonPressed;
  final Widget? secondaryButtonWidget;
  final CardOrientation cardOrientation;
  double deviceHeight = 631;

  CameraScannerOverlay({
    required this.cameraOverlayLayout,
    required this.scannerMessage,
    required this.primaryButtonText,
    required this.onPrimaryButtonPressed,
    required this.onBackButtonPressed,
    this.secondaryButtonWidget,
    this.primaryButtonBackgroundColor = DrivenColors.primaryButtonColor,
    this.cardOrientation = CardOrientation.landscape,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.sizeOf(context).height;
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
        mainAxisSize: MainAxisSize.min,
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
    final size = MediaQuery.sizeOf(context);

    final cutOutHeight = Utils.getCameraCutoutHeight(context, cardOrientation);

    final scannerMessageTopPadding =
        (size.height / 2) + (cutOutHeight / 2) + 40;

    return Positioned(
      top: scannerMessageTopPadding,
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
              backgroundColor: primaryButtonBackgroundColor,
            ),
            if (secondaryButtonWidget != null) secondaryButtonWidget!,
            SizedBox(height: deviceHeight < 680 ? 8 : 16),
          ],
        ),
      );
}
