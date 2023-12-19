part of driven_components_module;

class PaddedTextFixedFontSize extends StatelessWidget {
  final String data;
  final TextOverflow? overflow;
  final TextStyle style;
  final TextAlign? textAlign;
  final EdgeInsets padding;

  const PaddedTextFixedFontSize(
    this.data, {
    required this.padding,
    required this.style,
    Key? key,
    this.textAlign,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Nav1ExtraBold12.fixed(
        data,
        overflow: overflow,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
