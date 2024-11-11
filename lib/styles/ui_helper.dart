part of styles_module;

class UiHelper {
  static Function wrappedShowDialog = showDialog;
  static Function navigatorPop = Navigator.pop;

  static void circularLoader(BuildContext context, {required bool show}) {
    if (show) {
      wrappedShowDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const PopScope(
              canPop: false,
              child: Center(
                child: CircularProgressIndicator(
                  color: DrivenColors.lightGrey,
                ),
              ),
            );
          });
    } else {
      Get.back();
    }
  }

  static double screenHeight(BuildContext context, [int percentage = 100]) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  static bool isTablet() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide > 600;
  }

  static void clearFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static bool isSmallHeightResDevice() {
    final FlutterView view =
        WidgetsBinding.instance.platformDispatcher.views.first;
    final Size size = view.physicalSize / view.devicePixelRatio;

    final double height = size.height;

    return height <= 700;
  }

  static final MaskTextInputFormatter routeIdInputMask = MaskTextInputFormatter(
    mask: '########-##',
    filter: {'#': RegExp('[0-9]')},
  );

  static BoxDecoration drivenCardBoxDecoration({
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(10)),
  }) {
    return BoxDecoration(
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: DrivenColors.grey.withOpacity(0.3),
          offset: const Offset(0, 1),
          blurRadius: 8,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: DrivenColors.grey.withOpacity(0.3),
          offset: const Offset(0, 2),
          blurRadius: 3,
          spreadRadius: -2,
        )
      ],
      color: DrivenColors.white,
    );
  }
}
