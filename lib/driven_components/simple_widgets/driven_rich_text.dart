part of driven_components_module;

class DrivenRichText extends StatelessWidget {
  final List<TextSpan> text;
  final TextAlign textAlign;
  final double? fontSize;

  const DrivenRichText(
    this.text, {
    this.textAlign = TextAlign.center,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          color: DrivenColors.black90,
          fontSize: fontSize ?? 15,
          fontWeight: DrivenFonts.fontWeightRegular,
          height: 1.4,
        ),
        children: text,
      ),
      textAlign: textAlign,
    );
  }
}
