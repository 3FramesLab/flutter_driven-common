part of driven_components_module;

class DrivenText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  const DrivenText({
    super.key,
    required this.text,
    this.style = f16RegularBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
