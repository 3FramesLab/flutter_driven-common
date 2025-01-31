part of driven_components_module;

class DrivenCardWithLeftRightIcons extends StatelessWidget {
  final String leftIcon;
  final IconData leftMaterialIcon;
  final Color leftIconColor;
  final String text;
  final IconData rightIcon;
  final String rightSvgIcon;
  final VoidCallback onTap;
  final double verticalPadding;
  final String subTitle;
  final String description;

  const DrivenCardWithLeftRightIcons({
    super.key,
    this.leftIcon = '',
    this.leftIconColor = DrivenColors.primary,
    this.leftMaterialIcon = Icons.arrow_forward_ios_rounded,
    this.verticalPadding = 25,
    required this.text,
    this.rightIcon = Icons.arrow_forward_ios_rounded,
    this.rightSvgIcon = '',
    required this.onTap,
    this.subTitle = '',
    this.description = '',
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
    return Column(
      children: [
        Row(
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
            if (rightSvgIcon.isEmpty)
              Icon(
                rightIcon,
                color: DrivenColors.primary,
              )
            else
              SvgPicture.asset(rightSvgIcon),
          ],
        ),
        if (subTitle.isNotEmpty)
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            alignment: Alignment.centerLeft,
            child: DrivenText(
              text: subTitle,
              style: f12SemiboldGrey,
            ),
          ),
        if (description.isNotEmpty)
          Container(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
            alignment: Alignment.centerLeft,
            child: DrivenText(
              text: description,
              style: f14RegularBlack,
            ),
          )
      ],
    );
  }
}
