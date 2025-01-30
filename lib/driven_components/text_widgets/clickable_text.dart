part of driven_components_module;

class ClickableText extends StatelessWidget {
  final String title;
  final Color textColor;
  final MainAxisAlignment alignment;
  final VoidCallback? onTap;
  final TextDecoration decoration;
  final EdgeInsetsGeometry? padding;
  final HitTestBehavior? behavior;

  const ClickableText({
    required this.title,
    this.onTap,
    this.textColor = DrivenColors.black,
    this.alignment = MainAxisAlignment.center,
    this.decoration = TextDecoration.underline,
    this.padding,
    this.behavior,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Semantics(
          container: true,
          child: GestureDetector(
            behavior: behavior,
            onTap: onTap,
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: Text(
                title,
                style: DrivenTextStyle(
                  DrivenDimensions.large,
                  DrivenFonts.fontWeightSemibold,
                  textColor,
                  decoration: decoration,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
