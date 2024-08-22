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
    return Container(
      decoration: _decoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(leftIcon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: f16SemiboldBlack,
            ),
          ),
          Icon(
            rightIcon,
            color: DrivenColors.primaryAmazon,
          )
        ],
      ),
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
