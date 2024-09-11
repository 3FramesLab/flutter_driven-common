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
    return Container(
      decoration: UiHelper.drivenCardBoxDecoration(),
      child: Material(
        color: DrivenColors.transparent,
        child: InkWell(
          onTap: !isDisabled ? onTap : null,
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.blue.withOpacity(0.3),
          highlightColor: Colors.blue.withOpacity(0.1),
          child: Ink(
            height: 90,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _content(),
            ),
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
