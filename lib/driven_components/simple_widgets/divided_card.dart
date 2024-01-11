part of driven_components_module;

class DividedCard extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final String? titleMiddlePart;
  final String? titleLastPart;

  const DividedCard({
    required this.children,
    this.title,
    this.titleMiddlePart,
    this.titleLastPart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (title != null) _title(title),
            if (titleMiddlePart != null) _titleMiddle(),
            if (titleLastPart != null) _title(titleLastPart),
          ],
        ),
        _card(),
      ],
    );
  }

  Widget _title(title) {
    return PaddedText(
      title!,
      textAlign: TextAlign.left,
      padding: const EdgeInsets.only(left: 2, bottom: 10),
      style: f16RegularGrey,
    );
  }

  Widget _titleMiddle() {
    return PaddedText(
      titleMiddlePart!,
      textAlign: TextAlign.left,
      padding: const EdgeInsets.only(left: 4, bottom: 10, right: 2),
      style: f16SemiBoldLink,
    );
  }

  Widget _card() {
    final newChildren =
        children.intersperse(const Divider(height: 0, thickness: 1)).toList();

    return Card(
      margin: EdgeInsets.zero,
      shape: DrivenRectangleBorder.mediumRounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: newChildren,
      ),
    );
  }
}
