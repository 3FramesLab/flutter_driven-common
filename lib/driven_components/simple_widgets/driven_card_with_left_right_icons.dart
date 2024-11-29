part of driven_components_module;

class DrivenCardWithLeftRightIcons extends StatelessWidget {
  final String leftIcon;
  final IconData leftMaterialIcon;
  final Color leftIconColor;
  final String text;
  final IconData rightIcon;
  final VoidCallback onTap;
  final double verticalPadding;

  const DrivenCardWithLeftRightIcons({
    super.key,
    this.leftIcon = '',
    this.leftIconColor = DrivenColors.primary,
    this.leftMaterialIcon = Icons.arrow_forward_ios_rounded,
    this.verticalPadding = 25,
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
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: verticalPadding,
          ),
          child: _content(),
        ),
      ),
    );
  }

  Widget _content() {
    return Row(
      children: [
        if (leftIcon.isNotEmpty)
          Semantics(
            label: 'icon_$text',
            child: SvgPicture.asset(leftIcon),
          ),
        if (leftIcon.isEmpty)
          Semantics(
            label: 'icon_$text',
            child: Icon(
              leftMaterialIcon,
              color: leftIconColor,
            ),
          ),
        const SizedBox(width: 10),
        Expanded(
          child: DrivenText(
            text: text,
            style: f16SemiBoldBlack,
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
