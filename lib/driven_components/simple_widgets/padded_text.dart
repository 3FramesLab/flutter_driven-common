part of driven_components_module;

class PaddedText extends StatelessWidget {
  final String data;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsets padding;

  const PaddedText(
    this.data, {
    required this.padding,
    Key? key,
    this.style,
    this.textAlign,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        data,
        overflow: overflow,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
