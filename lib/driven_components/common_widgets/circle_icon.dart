import 'package:driven_common/styles/styles_module.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final double? circleRadius;
  final Color? circleColor;
  final Color? iconColor;
  final IconData icon;
  final double? iconSize;

  const CircleIcon({
    super.key,
    required this.icon,
    this.circleColor = DrivenColors.primaryDFC,
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
