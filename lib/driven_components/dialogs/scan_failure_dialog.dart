part of driven_components_module;

class ScanFailureDialog extends StatelessWidget {
  final VoidCallback? onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final Widget? icon;
  final String primaryButtonText;
  final String secondaryButtonText;
  final String title;
  final TextStyle titleTextStyle;
  final String? subTitle;
  final TextStyle subTitleTextStyle;
  final VoidCallback? onPopInvoked;

  const ScanFailureDialog({
    required this.title,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    this.titleTextStyle = f16RegularBlack,
    this.subTitle,
    this.subTitleTextStyle = f16RegularBlack,
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
        title,
        style: titleTextStyle,
        textAlign: TextAlign.center,
      );

  Widget _subTitleText() {
    if (subTitle == null) {
      return const SizedBox.shrink();
    } else {
      return Flexible(
          child: Text(
        subTitle!,
        style: subTitleTextStyle,
        textAlign: TextAlign.center,
      ));
    }
  }

  Widget get _primaryButton => PrimaryButton(
        onPressed: onPrimaryButtonTap?.call,
        text: primaryButtonText,
        backgroundColor: DrivenColors.primary,
      );

  Widget get _secondaryButton => ClickableText(
        title: secondaryButtonText,
        onTap: onSecondaryButtonTap?.call,
        textColor: DrivenColors.primary,
      );
}
