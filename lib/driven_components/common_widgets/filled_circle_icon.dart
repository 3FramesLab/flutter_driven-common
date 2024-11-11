part of driven_components_module;

class FilledCircleIcon extends StatelessWidget {
  final double? circleRadius;
  final Color? circleColor;
  final Color? iconColor;
  final IconData icon;
  final double? iconSize;

  const FilledCircleIcon({
    super.key,
    required this.icon,
    this.circleColor = DrivenColors.primary,
    this.iconColor = Colors.white,
    this.circleRadius = 20,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circleRadius,
      backgroundColor: circleColor,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
