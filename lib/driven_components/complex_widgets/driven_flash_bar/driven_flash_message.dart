part of driven_components_module;

class DrivenFlashMessage {
  factory DrivenFlashMessage() {
    return _singleton;
  }

  static String flashMessage = '';
  static String errorCode = '';
  static MessageType messageType = MessageType.error;
  static TextStyle textStyle = f16SemiBoldWhite;
  static Function()? onRemoteMessageTap;

  DrivenFlashMessage._internal();
  static final _singleton = DrivenFlashMessage._internal();
  static late OverlayEntry _overlayEntry;
  static bool _isVisible = false;
  CancelableOperation<void>? _cancelableOperation;

  // ignore: long-parameter-list
  void createView(String message, String code, int duration, MessageType type,
      {Function()? onRemoteMessageNotificationTap}) {
    flashMessage = message;
    errorCode = code;
    messageType = type;
    onRemoteMessageTap = onRemoteMessageNotificationTap;
    _overlayEntry = OverlayEntry(
      builder: (context) => DrivenFlashContent(widget: _flashView(context)),
    );
    Navigator.of(Get.overlayContext!).overlay?.insert(_overlayEntry);
    _isVisible = true;
    if (type == MessageType.success || type == MessageType.bannerInfo) {
      startDelayedOperation(duration);
    }
  }

  Widget _flashView(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          color: _backgroundColor(),
          borderRadius: _borderRadius,
        ),
        child: _flashContent(),
      ),
    );
  }

  void startDelayedOperation(int duration) {
    _cancelableOperation?.cancel(); // Cancel any existing operation
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(Duration(seconds: duration)),
    );
    _cancelableOperation?.value.then((_) {
      dismiss();
    }).catchError((_) {});
  }

  Color _backgroundColor() {
    return messageType == MessageType.success
        ? DrivenColors.flashGreen
        : messageType == MessageType.information ||
                messageType == MessageType.bannerInfo
            ? DrivenColors.lightOrange
            : messageType == MessageType.warning
                ? DrivenColors.orange
                : DrivenColors.red;
  }

  BorderRadius get _borderRadius => const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );

  Widget _flashContent() {
    return GestureDetector(
      onTap: dismiss,
      onVerticalDragUpdate: _onVerticalDragUpdate,
      onVerticalDragDown: (_) => dismiss,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 44, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _flashContentChildren,
            ),
          ),
          if (messageType == MessageType.notification)
            _notificationContent
          else
            const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget get _notificationContent {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: _backgroundColor(),
        borderRadius: _borderRadius,
      ),
      child: Column(
        children: [
          Container(height: 1, color: DrivenColors.white),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: onRemoteMessageTap,
                    child: notificationButton(DrivenConstants.viewMore)),
                Container(width: 2, height: 40, color: DrivenColors.white),
                InkWell(
                    onTap: dismiss,
                    child: notificationButton(DrivenConstants.close)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationButton(String text) {
    return Container(
        width: Get.width / 2 - 1,
        height: 45,
        alignment: Alignment.center,
        child: Text(text, style: f16SemiBoldLinkWhite));
  }

  List<Widget> get _flashContentChildren {
    return <Widget>[
      _leadingIcon(),
      const SizedBox(width: 8),
      messageContent(
        flashMessage,
        code: errorCode,
        type: messageType,
        style: textStyle,
      ),
      const SizedBox(width: 20),
      Image.asset(DrivenAssets.closeIcon),
    ];
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    // When dragging Up
    if (details.delta.dy < 0) {
      dismiss();
    }
  }

  Icon _leadingIcon() {
    return Icon(
      messageType == MessageType.success
          ? Icons.check_circle_outline
          : messageType == MessageType.bannerInfo
              ? Icons.info
              : messageType == MessageType.information
                  ? Icons.error
                  : Icons.warning_rounded,
      color: Colors.white,
    );
  }

  static Widget messageContent(
    String message, {
    String code = '',
    MessageType type = MessageType.error,
    TextStyle style = f16SemiBoldWhite,
  }) {
    final errorParser = DrivenErrorParser(message: message, code: code);
    switch (messageType) {
      case MessageType.systemError:
        return Expanded(
          child: RichText(
            key: const Key(DrivenConstants.systemErrorContent),
            text: TextSpan(
              style: style,
              children: errorParser.parseErrorMessage(),
            ),
          ),
        );
      default:
        return Expanded(
          child: Text(_messageText(message, code), style: style),
        );
    }
  }

  static String _messageText(String message, String code) => code.isEmpty
      ? message
      : '$message\n${DrivenConstants.errorCodeText}$code';

  static Future<void> dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry.remove();
  }
}
