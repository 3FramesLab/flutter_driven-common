part of driven_components_module;

class DrivenCardWithLeftIcon extends StatelessWidget {
  final String leftIcon;
  final String text;
  final VoidCallback onTap;

  const DrivenCardWithLeftIcon({
    super.key,
    required this.leftIcon,
    required this.text,
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
        SvgPicture.asset(leftIcon),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: f16SemiboldBlack,
          ),
        ),
      ],
    );
  }
}
