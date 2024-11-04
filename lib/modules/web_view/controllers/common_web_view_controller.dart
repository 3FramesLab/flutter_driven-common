part of common_module;

class CommonWebViewController extends GetxController {
  late InAppWebViewController webViewController;

  RxBool isLoading = true.obs;

  String? onLoadStopJavascript = '';

  void onLoadStart(InAppWebViewController controller, Uri? url) {
    isLoading(true);
  }

  Future<void> onLoadStop(InAppWebViewController controller, Uri? url) async {
    isLoading(false);
    await executeOnLoadStopJavascript();
  }

  Future<void> executeOnLoadStopJavascript() async {
    if (onLoadStopJavascript != null) {
      await webViewController.evaluateJavascript(source: onLoadStopJavascript!);
    }
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
