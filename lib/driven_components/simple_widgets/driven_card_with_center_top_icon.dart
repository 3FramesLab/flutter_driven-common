part of driven_components_module;

class DrivenCardWithCenterTopIcon extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const DrivenCardWithCenterTopIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
          width: double.infinity,
          decoration: _decoration(),
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
            style: f14SemiboldBlack,
          ),
        ),
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: DrivenColors.lightGrey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
