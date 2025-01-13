part of '../driven_components_module.dart';

class PasswordRuleDialog {
  List<Map<String, String>> passwordRules;

  PasswordRuleDialog({required this.passwordRules});

  Widget localDialogBuilder(BuildContext context) {
    return Semantics(
      container: true,
      label: SemanticStrings.passwordDialogClose,
      child: GestureDetector(
        onTap: Navigator.of(context).pop,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 44),
          decoration: const BoxDecoration(
            color: DrivenColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: PasswordRuleDialogContent(passwordRules: passwordRules),
        ),
      ),
    );
  }
}

class PasswordRuleDialogContent extends StatelessWidget {
  List<Map<String, String>> passwordRules;
  PasswordRuleDialogContent({
    Key? key,
    required this.passwordRules,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ruleTitleText(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: passwordRules.map(_ruleText).toList(),
          ),
        ),
      ],
    );
  }

  Widget _ruleTitleText() => const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: SubTitleText(
          title: DrivenConstants.passwordRuleFormatTitle,
          color: DrivenColors.grey800,
        ),
      );

  Widget _ruleText(Map<String, String> e) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: SubTitleText(
              title: DrivenConstants.smallDot,
              color: DrivenColors.grey800,
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubTitleText(
                  title: e['rule'] ?? '',
                  color: DrivenColors.grey800,
                ),
                if (e['sub-rule'] == null)
                  const SizedBox()
                else
                  _subRuleText(e['sub-rule'] ?? '')
              ],
            ),
          ),
        ],
      );

  Widget _subRuleText(String subRule) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: SubTitleText(
              title: DrivenConstants.hyphenSign,
              color: DrivenColors.grey800,
            ),
          ),
          Flexible(
            child: SubTitleText(
              title: subRule,
              color: DrivenColors.grey800,
            ),
          ),
        ],
      );
}
