part of driven_components_module;

class ViewLargeTitle extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;

  const ViewLargeTitle({
    required this.title,
    this.padding = const EdgeInsets.fromLTRB(20, 15, 10, 20),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Semantics(
        container: true,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: f24ExtraboldBlackDark,
        ),
      ),
    );
  }
}
