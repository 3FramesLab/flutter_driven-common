part of driven_components_module;

class SlideUpPanelService extends GetxService {
  static const Widget defaultPanel = Text('');
  PanelController controller = PanelController();
  PanelState panelState = PanelState.CLOSED;
  final Rx<Widget> _panelWidget = defaultPanel.obs;
  final RxInt height = 75.obs;
  final RxBool isDynamicHeight = false.obs; // Used for card settings
  final RxDouble topMargin = 30.0.obs;
  final Rx<Future<void> Function()> onPanelClosed = defaultCallback.obs;

  static Future<void> defaultCallback() async {}

  Future<void> callAndResetPanelClosed() async {
    await onPanelClosed.value();
    onPanelClosed(defaultCallback);
    panelWidget = defaultPanel;
    panelState = PanelState.CLOSED;
  }

  Widget get panelWidget {
    return _panelWidget();
  }

  set panelWidget(Widget widget) {
    _panelWidget(widget);
  }

  bool get isPanelOpen {
    return controller.isPanelOpen;
  }

  Future<void> close() async {
    await controller.close();
  }

  Future<void> open({
    double top = 30,
    int panelHeight = 75,
    bool dynamicHeight = false,
  }) async {
    height(panelHeight);
    topMargin(top);
    isDynamicHeight(dynamicHeight);
    await controller.open();
  }

  Future<void> openWidget(
    Widget widget, {
    double top = 30,
    int panelHeight = 75,
    bool dynamicHeight = false,
  }) async {
    height(panelHeight);
    topMargin(top);
    panelWidget = widget;
    isDynamicHeight(dynamicHeight);
    await controller.open();
  }
}
