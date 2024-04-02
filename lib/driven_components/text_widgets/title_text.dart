part of driven_components_module;

class TitleText extends StatelessWidget {
  final String title;
  final bool isPaddingRequired;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
    this.title, {
    super.key,
    this.color = DrivenColors.black,
    this.isPaddingRequired = true,
    this.fontSize = DrivenDimensions.xxxLarge,
    this.fontWeight = DrivenFonts.fontWeightExtraBold,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: title,
      container: true,
      child: Padding(
        padding: isPaddingRequired
            ? const EdgeInsets.only(top: 20)
            : EdgeInsets.zero,
        child: Text(
          title,
          style: DrivenTextStyle(
            fontSize,
            fontWeight,
            color,
          ),
        ),
      ),
    );
  }
}
