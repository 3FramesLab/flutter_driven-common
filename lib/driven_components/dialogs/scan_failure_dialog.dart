part of driven_components_module;

class ScanFailureDialog extends StatelessWidget {
  final VoidCallback? onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final String primaryButtonText;
  final String secondaryButtonText;
  final List<TextSpan> text;
  final VoidCallback? onPopInvoked;

  const ScanFailureDialog({
    required this.text,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    this.onPrimaryButtonTap,
    this.onSecondaryButtonTap,
    this.onPopInvoked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        if (value) {
          return;
        }
        onPopInvoked?.call();
      },
      child: TextScaleClamp(
        child: Dialog(
          insetPadding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            constraints: const BoxConstraints(minHeight: 208),
            child: DrivenColumn(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: _titleText),
                _primaryButton,
                _secondaryButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _titleText => Text.rich(
        TextSpan(
          style: const TextStyle(
            color: DrivenColors.black90,
            fontSize: 15,
            fontWeight: DrivenFonts.fontWeightRegular,
            height: 1.4,
          ),
          children: text,
        ),
        textAlign: TextAlign.center,
      );

  Widget get _primaryButton => PrimaryButton(
        onPressed: onPrimaryButtonTap?.call,
        text: primaryButtonText,
        backgroundColor: DrivenColors.primaryAmazon,
      );

  Widget get _secondaryButton => ClickableText(
        title: secondaryButtonText,
        onTap: onSecondaryButtonTap?.call,
        textColor: DrivenColors.primaryAmazon,
      );
}
