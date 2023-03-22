import 'package:flutter_test/flutter_test.dart';
import 'package:phoneinformations/phoneinformations.dart';
import 'package:phoneinformations/phoneinformations_platform_interface.dart';
import 'package:phoneinformations/phoneinformations_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPhoneinformationsPlatform 
    with MockPlatformInterfaceMixin
    implements PhoneinformationsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PhoneinformationsPlatform initialPlatform = PhoneinformationsPlatform.instance;

  test('$MethodChannelPhoneinformations is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPhoneinformations>());
  });

  test('getPlatformVersion', () async {
    Phoneinformations phoneinformationsPlugin = Phoneinformations();
    MockPhoneinformationsPlatform fakePlatform = MockPhoneinformationsPlatform();
    PhoneinformationsPlatform.instance = fakePlatform;
  
    expect(await phoneinformationsPlugin.getPlatformVersion(), '42');
  });
}
