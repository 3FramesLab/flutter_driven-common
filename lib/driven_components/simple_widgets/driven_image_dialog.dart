import 'package:driven_common/common/driven_constants.dart';
import 'package:driven_common/driven_components/driven_components_module.dart';
import 'package:driven_common/styles/styles_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrivenImageDialog extends StatelessWidget {
  final String title;
  final String image;
  final String? description;
  final VoidCallback? onPrimaryButtonTap;
  final String primaryButtonText;
  final VoidCallback? onPopInvoked;
  final Color buttonBackgroundColor;
  final TextStyle? descriptionStyle;

  const DrivenImageDialog({
    required this.title,
    required this.image,
    this.description,
    this.primaryButtonText = DrivenConstants.ok,
    this.onPrimaryButtonTap,
    this.onPopInvoked,
    this.buttonBackgroundColor = DrivenColors.primary,
    this.descriptionStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: _mainContent(),
    );
  }

  TextScaleClamp _mainContent() {
    return TextScaleClamp(
      child: _dialog(),
    );
  }

  Dialog _dialog() {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: DrivenColumn(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: AssetImage(image)),
              _divider(),
              _titleText,
              _divider(value: 14),
              _descriptionText,
              _divider(),
              _primaryButton,
              _divider(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _divider({double value = 16}) => SizedBox(height: value);

  void _onPopInvoked(value) {
    if (value) {
      return;
    }
    onPopInvoked?.call();
  }

  Widget get _titleText => Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: f24ExtraboldPrimary,
          ),
        ),
      );

  Widget get _descriptionText => Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            description ?? '',
            textAlign: TextAlign.center,
            style: descriptionStyle ?? f14SemiBoldBlack,
          ),
        ),
      );

  Widget get _primaryButton => PrimaryButton(
        onPressed: _onPrimaryButtonTap,
        text: primaryButtonText,
        backgroundColor: buttonBackgroundColor,
      );

  Function? _onPrimaryButtonTap() {
    if (onPrimaryButtonTap == null) {
      Get.back();
    }
    return onPrimaryButtonTap?.call;
  }
}
