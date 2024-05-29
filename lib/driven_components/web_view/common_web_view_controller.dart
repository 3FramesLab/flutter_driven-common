part of driven_components_module;

class CommonWebViewController extends GetxController {
  late InAppWebViewController webViewController;

  RxBool isLoading = true.obs;

  void onLoadStart(InAppWebViewController controller, Uri? url) {
    isLoading(true);
  }

  Future<void> onLoadStop(InAppWebViewController controller, Uri? url) async {
    isLoading(false);
  }

  void onError(
    InAppWebViewController controller,
    Uri? url,
    int code,
    String message,
  ) {
    isLoading(false);
  }

  Future<void> onBackPressed() async {
    isLoading(false);
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
    } else {
      Get.back();
    }
  }

  Future<void> onWebViewCreated(InAppWebViewController controller) async {
    webViewController = controller;
  }
}
