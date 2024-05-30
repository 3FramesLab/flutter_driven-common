part of driven_components_module;

class Subtitle1Regular16 extends SemanticsWrappedText {
  Subtitle1Regular16(
    String data, {
    super.key,
    Color color = DrivenColors.textColor,
    TextStyle style = const TextStyle(),
  }) : super(
          data,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ).merge(style),
        );
}

class Subtitle1Semibold16 extends Subtitle1Regular16 {
  Subtitle1Semibold16(
    String data, {
    super.key,
    Color color = DrivenColors.textColor,
    TextStyle style = const TextStyle(),
  }) : super(
          data,
          color: color,
          style: const TextStyle(
            fontWeight: DrivenFonts.fontWeightSemibold,
          ).merge(style),
        );
}
