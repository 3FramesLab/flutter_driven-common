part of driven_components_module;

class RichTextWithBoldTitle extends StatelessWidget {
  final String title;
  final String body;
  const RichTextWithBoldTitle({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _richText(),
        ),
      ],
    );
  }

  Widget _richText() {
    return RichText(
      text: TextSpan(
        text: title,
        style: f14BoldBlack,
        children: [
          TextSpan(
            text: body,
            style: f14RegularBlack,
          ),
        ],
      ),
    );
  }
}
