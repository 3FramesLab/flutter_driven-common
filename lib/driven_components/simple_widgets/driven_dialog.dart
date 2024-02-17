part of driven_components_module;

class DrivenDialog extends StatelessWidget {
  final Widget? titleWidget;
  final Widget? primaryButton;
  final Widget? secondaryButton;
  final List<TextSpan> text;
  final Widget? secondaryBody;
  final bool isDynamicAlert;
  final bool enableBackPress;
  final double height;
  final double? width;
  final bool? has3CTAButtons;
  final String? secondaryLeftButtonText;
  final String? secondaryRightButtonText;
  final String? clickableText;
  final void Function()? secondaryLeftButtonOnPressed;
  final void Function()? secondaryRightButtonOnPressed;
  final void Function()? onClickableTextPressed;

  const DrivenDialog({
    required this.text,
    this.titleWidget,
    this.primaryButton,
    this.secondaryButton,
    this.clickableText,
    this.secondaryBody,
    this.isDynamicAlert = false,
    this.enableBackPress = true,
    this.height = 105,
    this.width,
    this.has3CTAButtons = false,
    this.secondaryLeftButtonText,
    this.secondaryRightButtonText,
    this.secondaryLeftButtonOnPressed,
    this.secondaryRightButtonOnPressed,
    this.onClickableTextPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _bodyContainer(
      body: [
        _dialogTextView(),
        _dialogSecondaryBody(),
      ],
    );
  }

  Widget _clickableText() {
    return UnderlinedButton.black(
      onPressed: onClickableTextPressed,
      text: clickableText!,
    );
  }

  Widget _dialogTextView() => isDynamicAlert
      ? Align(child: DrivenRichText([...text]))
      : SizedBox(
          height: height,
          child: Align(child: DrivenRichText([...text])),
        );

  Widget _dialogSecondaryBody() {
    return secondaryBody != null ? secondaryBody! : const SizedBox();
  }

  Widget _bodyContainer({
    required List<Widget> body,
  }) {
    return WillPopScope(
      onWillPop: () => Future.value(enableBackPress),
      child: TextScaleClamp(
        child: Dialog(
          backgroundColor: DrivenColors.white,
          surfaceTintColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(8),
          shape: DrivenRectangleBorder.mediumRounded,
          child: Container(
            width: width,
            constraints: BoxConstraints(minHeight: isDynamicAlert ? 170 : 248),
            child: DrivenColumn(
              padding: _dialogPadding(),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                _titleWidget(),
                Column(children: body),
                SizedBox(height: isDynamicAlert ? 30 : 2),
                _actions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() =>
      (titleWidget != null) ? titleWidget! : const SizedBox.shrink();

  EdgeInsets _dialogPadding() => isDynamicAlert
      ? const EdgeInsets.fromLTRB(16, 32, 16, 16)
      : const EdgeInsets.all(16);

  Widget _actions() {
    if (has3CTAButtons ?? false) {
      return build3CTAButtons();
    } else {
      return Column(
        children: [
          primaryButton ?? const DefaultDialogCloseButton(),
          const VerticalSpacer(size: 8),
          if (secondaryButton != null) _secondaryButton(),
          if (secondaryRightButtonText != null)
            _secondaryRightButton(secondaryRightButtonText),
          if (clickableText != null) _clickableText(),
        ],
      );
    }
  }

  Widget _secondaryButton() => isDynamicAlert
      ? Align(child: secondaryButton)
      : SizedBox(
          height: 35,
          child: Align(child: secondaryButton),
        );

  Widget build3CTAButtons() {
    return Center(
      child: Column(
        children: [
          primaryButton ?? const DefaultDialogCloseButton(),
          const VerticalSpacer(size: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (secondaryLeftButtonText != null)
                _secondaryLeftButton(secondaryLeftButtonText),
              const SizedBox(
                height: 40,
                child: VerticalDivider(
                  width: 10,
                  thickness: 1,
                  color: DrivenColors.grey,
                ),
              ),
              if (secondaryRightButtonText != null)
                _secondaryRightButton(secondaryRightButtonText),
            ],
          ),
        ],
      ),
    );
  }

  Widget _secondaryLeftButton(buttonText) {
    const textStyle = TextStyle(
      fontSize: 14,
      fontWeight: DrivenFonts.fontWeightSemibold,
      color: Colors.black,
      decoration: TextDecoration.underline,
    );
    return TextButton(
      onPressed: secondaryLeftButtonOnPressed,
      child: Text(
        buttonText,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _secondaryRightButton(buttonText) {
    const textStyle = TextStyle(
      fontSize: 14,
      fontWeight: DrivenFonts.fontWeightSemibold,
      color: Colors.black,
      decoration: TextDecoration.underline,
    );
    return TextButton(
      onPressed: secondaryRightButtonOnPressed ?? Get.back,
      child: Text(
        buttonText,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class DefaultDialogCloseButton extends StatelessWidget {
  const DefaultDialogCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogButton(
      onPressed: () => Navigator.pop(context),
      text: DrivenConstants.ok,
    );
  }
}
