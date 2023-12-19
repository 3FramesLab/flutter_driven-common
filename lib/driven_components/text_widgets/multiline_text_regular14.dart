part of driven_components_module;

class MultilineTextRegular14 extends Text {
  MultilineTextRegular14(
    String data, {
    super.key,
    int maxLines = 2,
    Color color = blackDark,
    TextStyle style = const TextStyle(),
  }) : super(
          data,
          maxLines: maxLines,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 14,
            fontWeight: DrivenFonts.fontWeightRegular,
            color: color,
          ).merge(style),
        );
}
