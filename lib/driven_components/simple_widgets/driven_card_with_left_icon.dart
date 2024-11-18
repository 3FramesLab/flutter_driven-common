part of driven_components_module;

class DrivenCardWithLeftIcon extends StatelessWidget {
  final String leftIcon;
  final String text;
  final VoidCallback onTap;
  final double iconWidth;
  final double iconHeight;

  const DrivenCardWithLeftIcon({
    super.key,
    required this.leftIcon,
    required this.text,
    required this.onTap,
    this.iconWidth = 54,
    this.iconHeight = 44,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: UiHelper.drivenCardBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _content(),
        ),
      ),
    );
  }

  Widget _content() {
    return Row(
      children: [
        Semantics(
          label: 'icon_$text',
          child: SvgPicture.asset(
            leftIcon,
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: DrivenText(
            text: text,
            style: f16SemiBoldBlack,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
