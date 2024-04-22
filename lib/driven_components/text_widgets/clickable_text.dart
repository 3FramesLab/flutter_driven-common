part of driven_components_module;

class ClickableText extends StatelessWidget {
  final String title;
  final Color textColor;
  final MainAxisAlignment alignment;
  final VoidCallback? onTap;
  final TextDecoration decoration;

  const ClickableText({
    required this.title,
    this.onTap,
    this.textColor = DrivenColors.black,
    this.alignment = MainAxisAlignment.center,
    this.decoration = TextDecoration.underline,
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
            onTap: onTap,
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
        )
      ],
    );
  }
}
