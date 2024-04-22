part of driven_components_module;

class Body1Regular14 extends Text {
  Body1Regular14(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
    double? height,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? textScaleFactor,
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
        );
}

class Body1Regular14Lh23 extends Text {
  Body1Regular14Lh23(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
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
