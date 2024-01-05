import 'dart:async';

import 'package:driven_common/common/driven_constants.dart';
import 'package:driven_common/driven_common_resources_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InactivityController extends FullLifeCycleController
    with FullLifeCycleMixin {
  static const Duration _warningTime = Duration(minutes: 2);
  static const Duration _logOutTime = Duration(minutes: 3);

  bool enabled = false;

  Timer? logoutTimer;
  Timer? warningTimer;
  final RxBool applicationActive = true.obs;

  late Function(bool)? onTimerLogout;

  @override
  Future<void> onClose() async {
    cancelTimers();
    super.onClose();
  }

  void initializeTimers() {
    if (enabled) {
      cancelTimers();

      logoutTimer = Timer(_logOutTime, () => onTimerLogout!(true));
      warningTimer = Timer(_warningTime, _warn);
    }
  }

  void handleUserInteraction([_]) {
    initializeTimers();
  }

  void _cancelWarningTimer() {
    if (warningTimer != null) {
      warningTimer?.cancel();
    }
  }

  void _cancelLogoutTimer() {
    if (logoutTimer != null) {
      logoutTimer?.cancel();
    }
  }

  void cancelTimers() {
    _cancelLogoutTimer();
    _cancelWarningTimer();
  }

  void _warn() {
    if (applicationActive.value) {
      Get.dialog(DrivenDialog(
        text: const [
          TextSpan(text: DrivenConstants.youHaveBeenInactive),
        ],
        primaryButton: const DefaultDialogCloseButton(),
        secondaryButton: _inactivityLogoutButton(),
      )).then((_) => initializeTimers());
    }
  }

  Widget _inactivityLogoutButton() {
    return UnderlinedButton.black(
      onPressed: () => onTimerLogout!(false),
      text: DrivenConstants.logOut,
    );
  }

  void _resumeApplication() {
    applicationActive.value = true;

    if (logoutTimer != null && logoutTimer!.isActive) {
      initializeTimers();
    }
  }

  void _suspendApplication() {
    applicationActive.value = false;
  }

  @override
  void onDetached() {
    _suspendApplication();
  }

  @override
  void onInactive() {
    _suspendApplication();
  }

  @override
  void onPaused() {
    _suspendApplication();
  }

  @override
  void onResumed() {
    _resumeApplication();
  }
}
