part of driven_components_module;

class DividedCard extends StatelessWidget {
  final List<Widget> children;
  final String? title;

  const DividedCard({
    required this.children,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) _title(),
        _card(),
      ],
    );
  }

  Widget _title() {
    return PaddedText(
      title!,
      textAlign: TextAlign.left,
      padding: const EdgeInsets.only(left: 2, bottom: 10),
      style: f16RegularGrey,
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
