import 'package:driven_common/data/data_sources/remote/api_constants.dart';
import 'package:driven_common/globals.dart';
import 'package:flutter/foundation.dart';

import 'driven_common_platform_interface.dart';

class DrivenCommon {
  DrivenCommon._internal();
  static final DrivenCommon _instance = DrivenCommon._internal();
  static DrivenCommon get instance => _instance;

  Future<String?> getPlatformVersion() {
    return DrivenCommonPlatform.instance.getPlatformVersion();
  }

  Future<void> init({
    required String appFlavor,
    required String baseUrl,
  }) async {
    try {
      debugPrint('driven common package: init() called');
      ApiConstants.instance.baseUrl = baseUrl;
      Globals().init(flavor: appFlavor);
    } on Exception catch (_) {
      debugPrint('Error while initializing common resources packages');
    }
  }
}
