import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phoneinformations/phoneinformations_method_channel.dart';

void main() {
  MethodChannelPhoneinformations platform = MethodChannelPhoneinformations();
  const MethodChannel channel = MethodChannel('phoneinformations');

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
