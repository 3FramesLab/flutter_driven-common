part of driven_components_module;

class ScanFailureDialog extends StatelessWidget {
  final VoidCallback? onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final Widget? icon;
  final String primaryButtonText;
  final String secondaryButtonText;
  final String titleText;
  final TextStyle titleTextStyle;
  final String? subTitleText;
  final TextStyle? subTitleTextStyle;
  final VoidCallback? onPopInvoked;

  const ScanFailureDialog({
    required this.titleText,
    required this.titleTextStyle,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    this.subTitleText,
    this.subTitleTextStyle,
    this.onPrimaryButtonTap,
    this.onSecondaryButtonTap,
    this.onPopInvoked,
    this.icon,
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
            constraints: BoxConstraints(minHeight: icon == null ? 208 : 248),
            child: DrivenColumn(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                _label,
                const SizedBox(height: 8),
                _primaryButton,
                const SizedBox(height: 8),
                _secondaryButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _label => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          Flexible(child: _titleText),
          _subTitleText(),
        ],
      );

  Widget get _titleText => Text(
        titleText,
        style: titleTextStyle,
        textAlign: TextAlign.center,
      );

  Widget _subTitleText() {
    if (subTitleText == null) {
      return const SizedBox.shrink();
    } else {
      return Flexible(
          child: Text(
        subTitleText!,
        style: subTitleTextStyle ?? f14RegularBlack,
        textAlign: TextAlign.center,
      ));
    }
  }

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
