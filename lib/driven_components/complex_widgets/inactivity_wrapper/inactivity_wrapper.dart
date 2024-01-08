part of driven_components_module;

class InactivityWrapper extends StatelessWidget {
  final Function(bool)? onTimerOut;
  final bool isEnabled;
  final InactivityController controller = Get.find();
  final int warningTimeInMinutes;

  final Widget? child;

  InactivityWrapper({
    super.key,
    required this.child,
    this.onTimerOut,
    this.isEnabled = false,
    this.warningTimeInMinutes = 9,
  }) {
    controller.onTimerLogout = onTimerOut;
    controller.enabled = isEnabled;
    controller.warningTime = Duration(minutes: warningTimeInMinutes);
    controller.logOutTime = Duration(minutes: warningTimeInMinutes + 1);
    controller.initializeTimers();
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
