part of driven_components_module;

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final bool showNotificationDot;
  final double iconSize;
  final double circleSize;
  final VoidCallback? onTap;

  const CircleIcon({
    Key? key,
    required this.icon,
    this.showNotificationDot = false,
    this.iconSize = 20.0,
    this.circleSize = 32.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: DrivenColors.primary, width: 1.5),
            ),
            child: Center(
              child: Icon(
                icon,
                size: iconSize,
                color: DrivenColors.primary,
              ),
            ),
          ),
          if (showNotificationDot)
            Positioned(
              top: 6,
              right: 7,
              child: Container(
                width: 7.5,
                height: 7.5,
                decoration: const BoxDecoration(
                  color: DrivenColors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
