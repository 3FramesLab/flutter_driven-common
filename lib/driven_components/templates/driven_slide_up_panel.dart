import 'package:driven_common/driven_components/templates/slide_up_panel_service.dart';
import 'package:driven_common/styles/styles_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DrivenSlideUpPanel extends StatelessWidget {
  final SlideUpPanelService panel = Get.find();
  final Widget? body;

  DrivenSlideUpPanel({
    super.key,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SlidingUpPanel(
        backdropEnabled: true,
        backdropOpacity: 0.3,
        body: body,
        borderRadius: BorderRadius.circular(10),
        controller: panel.controller,
        defaultPanelState: panel.panelState,
        maxHeight: UiHelper.screenHeight(context, panel.height()),
        minHeight: 0,
        onPanelClosed: panel.callAndResetPanelClosed,
        panel: _panelHelper(),
      ),
    );
  }

  Widget _panelHelper() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => Container(
            margin: EdgeInsets.only(top: panel.topMargin()),
            child: panel.panelWidget,
          ),
        ),
      ),
    );
  }
}
