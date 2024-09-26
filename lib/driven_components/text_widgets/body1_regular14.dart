part of driven_components_module;

class Body1Regular14 extends SemanticsWrappedText {
  Body1Regular14(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
    double? height,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? textScaleFactor,
    String? semanticLabel,
  }) : super(
          data,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: DrivenColors.textColor,
            height: height,
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          semanticLabel: semanticLabel,
        );
}

class Body1Regular14Lh23 extends SemanticsWrappedText {
  Body1Regular14Lh23(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticLabel,
    bool? softWrap,
  }) : super(
          data,
          style: const TextStyle(
            fontSize: 14,
            color: DrivenColors.textColor,
            height: 23 / 14,
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          softWrap: softWrap,
          semanticLabel: semanticLabel,
        );

  Body1Regular14Lh23.fixed(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
    double height = 23 / 14,
    TextAlign? textAlign,
  }) : super(
          data,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: DrivenColors.textColor,
            height: height,
          ).merge(style),
          textAlign: textAlign,
          textScaleFactor: 1,
        );
}

class Body1Semibold14Lh23 extends Body1Regular14Lh23 {
  Body1Semibold14Lh23(String data, {super.key})
      : super(
          data,
          style: const TextStyle(
            fontWeight: DrivenFonts.fontWeightSemibold,
          ),
        );

  Body1Semibold14Lh23.fixed(String data, {super.key})
      : super(
          data,
          style: const TextStyle(
            fontWeight: DrivenFonts.fontWeightSemibold,
          ),
          textScaleFactor: 1,
        );
}

class Body1SemiBold16Lh23 extends SemanticsWrappedText {
  Body1SemiBold16Lh23(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticLabel,
  }) : super(
          data,
          style: const TextStyle(
            fontSize: 16,
            color: DrivenColors.textColor,
            height: 23 / 14,
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticLabel: semanticLabel,
        );

  Body1SemiBold16Lh23.fixed(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
    double height = 23 / 14,
    TextAlign? textAlign,
  }) : super(
          data,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: DrivenColors.textColor,
            height: height,
          ).merge(style),
          textAlign: textAlign,
          textScaleFactor: 1,
        );
}

class SemanticsWrappedText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticLabel;
  final bool? softWrap;

  const SemanticsWrappedText(
    this.data, {
    this.style = const TextStyle(),
    this.textAlign,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticLabel,
    this.softWrap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Text(
        data,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticLabel,
        softWrap: softWrap,
      ),
    );
  }
}
