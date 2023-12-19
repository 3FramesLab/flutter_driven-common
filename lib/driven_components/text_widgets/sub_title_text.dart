part of driven_components_module;

class SubTitleText extends StatelessWidget {
  final String title;
  final Color? color;
  final double fontSize;
  final double? fontHeight;
  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final TextDecoration? decoration;

  const SubTitleText({
    required this.title,
    this.alignment,
    this.decoration,
    this.color = DrivenColors.black,
    this.fontSize = DrivenDimensions.medium,
    this.fontWeight = FontWeight.normal,
    this.fontHeight = DrivenDimensions.lineHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Container(
        alignment: alignment,
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
            height: fontHeight,
          ),
        ),
      ),
    );
  }
}
