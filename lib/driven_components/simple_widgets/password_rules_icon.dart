// ignore_for_file: use_build_context_synchronously

part of '../driven_components_module.dart';

class DrivenPasswordRulesIcon extends StatelessWidget {
  final ScrollController? scrollController;
  final double? animateOffset;
  final List<Map<String, String>> passwordRules;
  final bool canShowQuestionMaterialIcon;

  const DrivenPasswordRulesIcon({
    super.key,
    this.scrollController,
    this.animateOffset,
    this.passwordRules = const [],
    this.canShowQuestionMaterialIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
        container: true,
        label: SemanticStrings.showPasswordRule,
        child: GestureDetector(
          onTap: () => _onImageClick(context),
          child: _questionMarkImage(),
        ));
  }

  Future<void> _onImageClick(BuildContext context) async {
    await scrollToTop();
    FocusScope.of(context).requestFocus(FocusNode());
    await showAlignedDialog(
      context: context,
      builder: DrivenPasswordRulesDialog(passwordRules: passwordRules)
          .localDialogBuilder,
      followerAnchor: Alignment.topLeft,
      targetAnchor: Alignment.bottomLeft,
    );
  }

  Widget _questionMarkImage() {
    if (canShowQuestionMaterialIcon) {
      return const Icon(
        Icons.help,
        size: 24,
        color: DrivenColors.black,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Image.asset(
          DrivenAssets.questionMarkIcon,
          height: 20,
          width: 20,
        ),
      );
    }
  }

  Future<void> scrollToTop() async {
    await scrollController?.animateTo(
      animateOffset ?? 0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }
}
