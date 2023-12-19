part of driven_components_module;

class PaddedDivider extends StatelessWidget {
  final EdgeInsets padding;

  const PaddedDivider({
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const Divider(
        thickness: 1,
        indent: 20,
        endIndent: 20,
        height: 0,
      ),
    );
  }
}
