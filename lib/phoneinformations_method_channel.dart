import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'model/phone_infos.dart';
import 'phoneinformations_platform_interface.dart';

/// An implementation of [PhoneinformationsPlatform] that uses method channels.
class MethodChannelPhoneinformations extends PhoneinformationsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('phoneinformations');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<PhoneInfo> getPhoneInformation() async {
    return PhoneInfo.fromMap(
        (await methodChannel.invokeMapMethod('getPhoneInformations'))!
            .cast<String, dynamic>());
  }
}
