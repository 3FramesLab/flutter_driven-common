import 'package:flutter/foundation.dart';

import 'driven_common_platform_interface.dart';

class DrivenCommon {
  Future<String?> getPlatformVersion() {
    return DrivenCommonPlatform.instance.getPlatformVersion();
  }

  Future<void> init({required String appFlavor}) async {
    try {
      debugPrint('driven common package: init() called');
    } on Exception catch (_) {
      debugPrint('Error while initializing common resources packages');
    }
  }
}
