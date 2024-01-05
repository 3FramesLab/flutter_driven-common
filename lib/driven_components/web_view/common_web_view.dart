part of driven_components_module;

class CommonWebView extends StatefulWidget {
  const CommonWebView({super.key});

  @override
  State<CommonWebView> createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  final CommonWebViewController commonWebViewController = Get.find();

  late final URLRequest? initialUrlRequest;
  late final String webViewTitle;

  final InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      _getWebViewArguments;
    }
  }

  void get _getWebViewArguments => {
        initialUrlRequest = URLRequest(
          url: Uri.parse(Get.arguments[CommonRouteArguments.webViewUrl]),
        ),
        webViewTitle = Get.arguments[CommonRouteArguments.webViewTitle]
      };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: _appBar,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewLargeTitle(title: webViewTitle),
                  if (initialUrlRequest != null) ...[
                    _loadWebView(context, initialUrlRequest!)
                  ]
                ],
              ),
              _progressIndicator,
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget get _appBar => DrivenAppBar(
        leading: DrivenBackButton(
          onPressed: commonWebViewController.onBackPressed,
        ),
      );

  Widget _loadWebView(BuildContext context, URLRequest initialUrl) => Expanded(
        child: InAppWebView(
          initialOptions: options,
          initialUrlRequest: initialUrl,
          onWebViewCreated: commonWebViewController.onWebViewCreated,
          onLoadStart: commonWebViewController.onLoadStart,
          onLoadStop: commonWebViewController.onLoadStop,
          onLoadHttpError: commonWebViewController.onError,
          onLoadError: commonWebViewController.onError,
        ),
      );

  Widget get _progressIndicator => Obx(
        () => CupertinoProgressIndicator(
          showLoader: commonWebViewController.isLoading(),
        ),
      );

  Future<bool> _onWillPop() {
    commonWebViewController.onBackPressed();
    return Future.value(false);
  }
}
