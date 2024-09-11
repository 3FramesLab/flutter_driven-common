part of driven_components_module;

class DrivenCardWithCenterTopIcon extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  const DrivenCardWithCenterTopIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: !isDisabled ? onTap : null,
        child: Container(
          height: 90,
          width: double.infinity,
          decoration: UiHelper.drivenCardBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _content(),
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(height: 2),
        Expanded(
          child: DrivenText(
            text: text,
            style: isDisabled ? f14SemiboldDisabled : f14SemiboldBlack,
          ),
        ),
      ],
    );
  }
}
