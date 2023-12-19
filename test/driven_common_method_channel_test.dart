import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:driven_common/driven_common_method_channel.dart';

void main() {
  MethodChannelDrivenCommon platform = MethodChannelDrivenCommon();
  const MethodChannel channel = MethodChannel('driven_common');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
