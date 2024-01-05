import 'package:driven_common/driven_components/complex_widgets/back_disabled_wrapper.dart';
import 'package:driven_common/driven_components/complex_widgets/inactivity_wrapper/inactivity_wrapper.dart';
import 'package:driven_common/driven_components/driven_components_module.dart';
import 'package:driven_common/driven_components/templates/driven_slide_up_panel.dart';
import 'package:flutter/material.dart';

class DrivenScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool disableBack;
  final Color? backgroundColor;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool goesInactive;
  final Function(bool)? onTimerOut;
  final bool isInactivityWrapperActivated;

  const DrivenScaffold({
    Key? key,
    this.appBar,
    this.disableBack = false,
    this.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.goesInactive = true,
    this.onTimerOut,
    this.isInactivityWrapperActivated = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );

    widget = DrivenSlideUpPanel(body: widget);
    widget = _inactivityWrapper(widget);
    widget = _textScaleClampWrapper(widget);
    return _backDisabledWrapper(widget);
  }

  Widget _backDisabledWrapper(Widget widget) {
    if (disableBack) {
      return BackDisabledWrapper(child: widget);
    } else {
      return widget;
    }
  }

  Widget _inactivityWrapper(Widget widget) {
    return goesInactive
        ? InactivityWrapper(
            isEnabled: isInactivityWrapperActivated,
            onTimerOut: (value) => onTimerOut!(value),
            child: widget,
          )
        : widget;
  }

  Widget _textScaleClampWrapper(Widget widget) {
    return TextScaleClamp(child: widget);
  }
}
