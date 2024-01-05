import 'package:driven_common/driven_components/complex_widgets/inactivity_wrapper/inactivity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InactivityWrapper extends StatelessWidget {
  final Function(bool)? onTimerOut;
  final bool isEnabled;
  final InactivityController controller = Get.find();

  final Widget? child;

  InactivityWrapper({
    super.key,
    required this.child,
    this.onTimerOut,
    this.isEnabled = false,
  }) {
    controller.initializeTimers();
    controller.onTimerLogout = onTimerOut;
    controller.enabled = isEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: controller.handleUserInteraction,
      onPanDown: controller.handleUserInteraction,
      child: child,
    );
  }
}
