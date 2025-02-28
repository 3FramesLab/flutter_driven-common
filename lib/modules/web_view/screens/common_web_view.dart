part of common_module;

class CommonWebViewScreen extends StatefulWidget {
  const CommonWebViewScreen({super.key});

  @override
  State<CommonWebViewScreen> createState() => _CommonWebViewScreenState();
}

class _CommonWebViewScreenState extends State<CommonWebViewScreen> {
  final CommonWebViewController _commonWebViewController = Get.find();

  late final URLRequest? initialUrlRequest;
  late final String webViewTitle;
  late final Color primaryColor;

  final InAppWebViewSettings initialSettings = InAppWebViewSettings(
    useShouldOverrideUrlLoading: true,
    transparentBackground: true,
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
          url: WebUri(Get.arguments[CommonRouteArguments.webViewUrl]),
        ),
        webViewTitle = Get.arguments[CommonRouteArguments.webViewTitle],
        primaryColor = Get.arguments[CommonRouteArguments.webViewPrimaryColor],
        _commonWebViewController.onLoadStopJavascript =
            Get.arguments[CommonRouteArguments.webViewOnLoadStopJavascript],
      };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: _onPopScope,
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

  Set<Factory<DragGestureRecognizer>> get _gestureRecognizers => {
        const Factory<VerticalDragGestureRecognizer>(
            VerticalDragGestureRecognizer.new),
      };

  PreferredSizeWidget get _appBar => DrivenAppBar(
        leading: DrivenBackButton(
          onPressed: _commonWebViewController.onBackPressed,
          color: primaryColor,
        ),
      );

  Widget _loadWebView(BuildContext context, URLRequest initialUrl) => Expanded(
        child: InAppWebView(
          gestureRecognizers: _gestureRecognizers,
          initialSettings: initialSettings,
          initialUrlRequest: initialUrl,
          onWebViewCreated: _commonWebViewController.onWebViewCreated,
          onLoadStart: _commonWebViewController.onLoadStart,
          onLoadStop: _commonWebViewController.onLoadStop,
          onReceivedHttpError: _commonWebViewController.onReceivedHttpError,
          onReceivedError: _commonWebViewController.onReceivedError,
          shouldOverrideUrlLoading:
              _commonWebViewController.shouldOverrideUrlLoading,
        ),
      );

  Widget get _progressIndicator => Obx(
        () => CupertinoProgressIndicator(
          showLoader: _commonWebViewController.isLoading(),
        ),
      );

  void _onPopScope(bool didPop) {
    if (didPop) {
      return;
    }
    _commonWebViewController.onBackPressed();
  }
}
