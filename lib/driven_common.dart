import 'package:driven_common/globals.dart';
import 'package:flutter/foundation.dart';

import 'driven_common_platform_interface.dart';

class DrivenCommon {
  Future<String?> getPlatformVersion() {
    return DrivenCommonPlatform.instance.getPlatformVersion();
  }

  Future<void> init({required String appFlavor}) async {
    try {
      debugPrint('driven common package: init() called');
      Globals().init(flavor: appFlavor);
    } on Exception catch (_) {
      debugPrint('Error while initializing common resources packages');
    }
  }
}
