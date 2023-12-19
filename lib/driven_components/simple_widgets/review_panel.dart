part of driven_components_module;

class ReviewPanel extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;

  const ReviewPanel({
    required this.children,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...children,
        Padding(
          padding: padding,
          child: const Divider(height: 48, thickness: 1),
        ),
      ],
    );
  }

  static Widget spacedRow(Widget left, Widget right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        left,
        right,
      ],
    );
  }

  static Widget centerSpacedRow(Widget left, Widget right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        Expanded(child: right),
      ],
    );
  }

  static Widget centerInfoRow(Widget widget) {
    return Center(
      child: widget,
    );
  }
}
