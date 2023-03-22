import 'dart:collection';
import 'dart:convert';

class PhoneInfo {
  String model = "";
  String andoidVersion = "";
  String serial = "";
  String id = "";
  String androidId = "";
  String manufacturer = "";
  String brand = "";
  String sdkInt = "";
  String simSerialNumber = "";
  String simNumber = "";
  String subscriberID = "";
  String networkCountryISO = "";
  String simCountryISO = "";
  String softwareVersion = "";
  String voiceMailNumber = "";
  String networkType = "";
  String networkGeneration = "";
  String cid = "";
  String lac = "";
  String simOperator = "";
  PhoneInfo({
    required this.model,
    required this.andoidVersion,
    required this.serial,
    required this.id,
    required this.androidId,
    required this.manufacturer,
    required this.brand,
    required this.sdkInt,
    required this.simSerialNumber,
    required this.simNumber,
    required this.subscriberID,
    required this.networkCountryISO,
    required this.simCountryISO,
    required this.softwareVersion,
    required this.voiceMailNumber,
    required this.networkType,
    required this.networkGeneration,
    required this.cid,
    required this.lac,
    required this.simOperator,
  });

  PhoneInfo copyWith({
    String? model,
    String? andoidVersion,
    String? serial,
    String? id,
    String? androidId,
    String? manufacturer,
    String? brand,
    String? sdkInt,
    String? simSerialNumber,
    String? simNumber,
    String? subscriberID,
    String? networkCountryISO,
    String? simCountryISO,
    String? softwareVersion,
    String? voiceMailNumber,
    String? networkType,
    String? networkGeneration,
    String? cid,
    String? lac,
    String? simOperator,
  }) {
    return PhoneInfo(
      model: model ?? this.model,
      andoidVersion: andoidVersion ?? this.andoidVersion,
      serial: serial ?? this.serial,
      id: id ?? this.id,
      androidId: androidId ?? this.androidId,
      manufacturer: manufacturer ?? this.manufacturer,
      brand: brand ?? this.brand,
      sdkInt: sdkInt ?? this.sdkInt,
      simSerialNumber: simSerialNumber ?? this.simSerialNumber,
      simNumber: simNumber ?? this.simNumber,
      subscriberID: subscriberID ?? this.subscriberID,
      networkCountryISO: networkCountryISO ?? this.networkCountryISO,
      simCountryISO: simCountryISO ?? this.simCountryISO,
      softwareVersion: softwareVersion ?? this.softwareVersion,
      voiceMailNumber: voiceMailNumber ?? this.voiceMailNumber,
      networkType: networkType ?? this.networkType,
      networkGeneration: networkGeneration ?? this.networkGeneration,
      cid: cid ?? this.cid,
      lac: lac ?? this.lac,
      simOperator: simOperator ?? this.simOperator,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'andoidVersion': andoidVersion,
      'serial': serial,
      'id': id,
      'androidId': androidId,
      'manufacturer': manufacturer,
      'brand': brand,
      'sdkInt': sdkInt,
      'simSerialNumber': simSerialNumber,
      'simNumber': simNumber,
      'subscriberID': subscriberID,
      'networkCountryISO': networkCountryISO,
      'simCountryISO': simCountryISO,
      'softwareVersion': softwareVersion,
      'voiceMailNumber': voiceMailNumber,
      'networkType': networkType,
      'networkGeneration': networkGeneration,
      'cid': cid,
      'lac': lac,
      'simOperator': simOperator,
    };
  }

  factory PhoneInfo.fromMap(Map<String, dynamic> map) {
    return PhoneInfo(
      model: map['model'] ?? '',
      andoidVersion: map['andoidVersion'] ?? '',
      serial: map['serial'] ?? '',
      id: map['id'] ?? '',
      androidId: map['androidId'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      brand: map['brand'] ?? '',
      sdkInt: map['sdkInt'] ?? '',
      simSerialNumber: map['simSerialNumber'] ?? '',
      simNumber: map['simSerialNumber'] ?? '',
      subscriberID: map['subscriberID'] ?? '',
      networkCountryISO: map['networkCountryISO'] ?? '',
      simCountryISO: map['simCountryISO'] ?? '',
      softwareVersion: map['softwareVersion'] ?? '',
      voiceMailNumber: map['voiceMailNumber'] ?? '',
      networkType: map['networkType'] ?? '',
      networkGeneration: map['networkGeneration'] ?? '',
      cid: map['cid'] ?? '',
      lac: map['lac'] ?? '',
      simOperator: map['simOperator'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneInfo.fromJson(String source) =>
      PhoneInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhoneInfo(model: $model, andoidVersion: $andoidVersion, serial: $serial, id: $id, androidId: $androidId, manufacturer: $manufacturer, brand: $brand, sdkInt: $sdkInt, simSerialNumber: $simSerialNumber, subscriberID: $subscriberID, networkCountryISO: $networkCountryISO, simCountryISO: $simCountryISO, softwareVersion: $softwareVersion, voiceMailNumber: $voiceMailNumber, networkType: $networkType, networkGeneration: $networkGeneration, cid: $cid, lac: $lac, simOperator: $simOperator)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneInfo &&
        other.model == model &&
        other.andoidVersion == andoidVersion &&
        other.serial == serial &&
        other.id == id &&
        other.androidId == androidId &&
        other.manufacturer == manufacturer &&
        other.brand == brand &&
        other.sdkInt == sdkInt &&
        other.simSerialNumber == simSerialNumber &&
        other.simNumber == simNumber &&
        other.subscriberID == subscriberID &&
        other.networkCountryISO == networkCountryISO &&
        other.simCountryISO == simCountryISO &&
        other.softwareVersion == softwareVersion &&
        other.voiceMailNumber == voiceMailNumber &&
        other.networkType == networkType &&
        other.networkGeneration == networkGeneration &&
        other.cid == cid &&
        other.lac == lac &&
        other.simOperator == simOperator;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        andoidVersion.hashCode ^
        serial.hashCode ^
        id.hashCode ^
        androidId.hashCode ^
        manufacturer.hashCode ^
        brand.hashCode ^
        sdkInt.hashCode ^
        simSerialNumber.hashCode ^
        subscriberID.hashCode ^
        networkCountryISO.hashCode ^
        simCountryISO.hashCode ^
        softwareVersion.hashCode ^
        voiceMailNumber.hashCode ^
        networkType.hashCode ^
        networkGeneration.hashCode ^
        cid.hashCode ^
        lac.hashCode ^
        simOperator.hashCode;
  }
}
