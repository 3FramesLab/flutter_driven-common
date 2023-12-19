import 'package:flutter_test/flutter_test.dart';
import 'package:driven_common/driven_common.dart';
import 'package:driven_common/driven_common_platform_interface.dart';
import 'package:driven_common/driven_common_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDrivenCommonPlatform
    with MockPlatformInterfaceMixin
    implements DrivenCommonPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DrivenCommonPlatform initialPlatform = DrivenCommonPlatform.instance;

  test('$MethodChannelDrivenCommon is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDrivenCommon>());
  });

  test('getPlatformVersion', () async {
    DrivenCommon drivenCommonPlugin = DrivenCommon();
    MockDrivenCommonPlatform fakePlatform = MockDrivenCommonPlatform();
    DrivenCommonPlatform.instance = fakePlatform;

    expect(await drivenCommonPlugin.getPlatformVersion(), '42');
  });
}
