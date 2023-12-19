
import 'driven_common_platform_interface.dart';

class DrivenCommon {
  Future<String?> getPlatformVersion() {
    return DrivenCommonPlatform.instance.getPlatformVersion();
  }
}
