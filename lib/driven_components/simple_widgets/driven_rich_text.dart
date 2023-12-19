part of driven_components_module;

class DrivenRichText extends StatelessWidget {
  final List<TextSpan> text;

  const DrivenRichText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          color: DrivenColors.black90,
          fontSize: 15,
          fontWeight: DrivenFonts.fontWeightRegular,
          height: 1.4,
        ),
        children: text,
      ),
      textAlign: TextAlign.center,
    );
  }
}
