
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model/phoneInfos.dart';
import 'phoneinformations_method_channel.dart';

export 'model/phoneInfos.dart';
abstract class PhoneinformationsPlatform extends PlatformInterface {
  /// Constructs a PhoneinformationsPlatform.
  PhoneinformationsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PhoneinformationsPlatform _instance = MethodChannelPhoneinformations();

  /// The default instance of [PhoneinformationsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPhoneinformations].
  static PhoneinformationsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PhoneinformationsPlatform] when
  /// they register themselves.
  static set instance(PhoneinformationsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

    Future <PhoneInfo> getPhoneInformation() {
    throw UnimplementedError('PhoneInformation() has not been implemented.');
  }
}
