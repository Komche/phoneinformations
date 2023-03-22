


import 'package:permission_handler/permission_handler.dart';
import 'package:phoneinformations/phoneinformations_platform_interface.dart';

export 'package:phoneinformations/phoneinformations_platform_interface.dart'
show PhoneInfo;

class Phoneinformations {
  Future<String?> getPlatformVersion() {
    return PhoneinformationsPlatform.instance.getPlatformVersion();
  }

    static Future<PhoneInfo>  getPhoneInformation()  async {
    await [
      Permission.location,
      Permission.phone,
      Permission.sms,
    ].request();
    return await PhoneinformationsPlatform.instance.getPhoneInformation();
  }
}
