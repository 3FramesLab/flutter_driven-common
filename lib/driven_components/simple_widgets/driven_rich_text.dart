part of driven_components_module;

class DrivenRichText extends StatelessWidget {
  final List<TextSpan> text;
  final TextAlign textAlign;
  final double? fontSize;
  final TextStyle? textStyle;

  const DrivenRichText(
    this.text, {
    this.textAlign = TextAlign.center,
    this.fontSize,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: _textStyle,
        children: text,
      ),
      textAlign: textAlign,
    );
  }

  TextStyle get _textStyle =>
      textStyle ??
      TextStyle(
        color: DrivenColors.black90,
        fontSize: fontSize ?? 15,
        fontWeight: DrivenFonts.fontWeightRegular,
        height: 1.4,
      );
}
