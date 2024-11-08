part of driven_components_module;

class DrivenCardWithLeftRightIcons extends StatelessWidget {
  final String leftIcon;
  final String text;
  final IconData rightIcon;
  final VoidCallback onTap;

  const DrivenCardWithLeftRightIcons({
    super.key,
    required this.leftIcon,
    required this.text,
    this.rightIcon = Icons.arrow_forward_ios_rounded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: UiHelper.drivenCardBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
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
          child: SvgPicture.asset(leftIcon),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DrivenText(
            text: text,
            style: f16SemiboldBlack,
          ),
        ),
        Icon(
          rightIcon,
          color: DrivenColors.primary,
        )
      ],
    );
  }
}
