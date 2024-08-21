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
            return const Center(
              child: CircularProgressIndicator(
                color: DrivenColors.lightGrey,
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
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
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
}
