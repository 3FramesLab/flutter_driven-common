import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'driven_common_method_channel.dart';

abstract class DrivenCommonPlatform extends PlatformInterface {
  /// Constructs a DrivenCommonPlatform.
  DrivenCommonPlatform() : super(token: _token);

  static final Object _token = Object();

  static DrivenCommonPlatform _instance = MethodChannelDrivenCommon();

  /// The default instance of [DrivenCommonPlatform] to use.
  ///
  /// Defaults to [MethodChannelDrivenCommon].
  static DrivenCommonPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DrivenCommonPlatform] when
  /// they register themselves.
  static set instance(DrivenCommonPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
