part of driven_components_module;

class Nav1ExtraBold12 extends SemanticsWrappedText {
  Nav1ExtraBold12.fixed(
    String data, {
    TextStyle style = const TextStyle(),
    TextAlign? textAlign,
    TextOverflow? overflow,
    super.key,
  }) : super(
          data,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: DrivenFonts.fontWeightExtraBold,
            color: Colors.black,
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          textScaleFactor: 1,
        );
}
