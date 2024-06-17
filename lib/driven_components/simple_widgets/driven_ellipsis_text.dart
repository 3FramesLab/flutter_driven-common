part of driven_components_module;

class DrivenEllipsisText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const DrivenEllipsisText({
    required this.data,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Text(
        data,
        overflow: TextOverflow.ellipsis,
        style: style,
        softWrap: false,
      ),
    );
  }
}
