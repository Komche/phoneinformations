


import 'package:permission_handler/permission_handler.dart';
import 'package:phoneinformations/model/phoneInfos.dart';

import 'phoneinformations_platform_interface.dart';

class Phoneinformations {
  Future<String?> getPlatformVersion() {
    return PhoneinformationsPlatform.instance.getPlatformVersion();
  }

    Future<PhoneInfo>  getPhoneInformation()  async {
    await [
      Permission.location,
      Permission.phone,
      Permission.sms,
    ].request();
    return await PhoneinformationsPlatform.instance.getPhoneInformation();
  }
}
