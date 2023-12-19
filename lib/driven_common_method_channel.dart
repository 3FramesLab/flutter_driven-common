import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'driven_common_platform_interface.dart';

/// An implementation of [DrivenCommonPlatform] that uses method channels.
class MethodChannelDrivenCommon extends DrivenCommonPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('driven_common');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
