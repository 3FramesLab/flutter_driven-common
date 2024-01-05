part of driven_components_module;

class InactivityController extends FullLifeCycleController
    with FullLifeCycleMixin {
  Duration warningTime = const Duration(minutes: 9);
  Duration logOutTime = const Duration(minutes: 10);

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

      logoutTimer = Timer(logOutTime, () => onTimerLogout!(true));
      warningTimer = Timer(warningTime, _warn);
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
