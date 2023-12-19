part of driven_components_module;

class SendToText extends StatelessWidget {
  final String text;
  const SendToText({super.key, this.text = DrivenConstants.sendToMobilePhone});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Semantics(
        container: true,
        label: SemanticStrings.sendToText,
        child: Center(
          child: Text(
            '${DrivenConstants.sendToText}$text',
            style: f16SemiBoldLink,
          ),
        ),
      ),
    );
  }
}
