# Phone Informations Flutter Plugin

## Description

The Phone Informations Flutter Plugin is a simple plugin that provides access to information related to the user's phone such as the device model, Android version, serial number, SIM card information, and more.

## Installation

Add `phoneinformations` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  phoneinformations: ^1.0.0
```

## Usage

To use this plugin, you will first need to import it in your Dart code:

```dart
import 'package:phoneinformations/phoneinformations.dart';
```

Then, in your code, you can use the following method to get the phone information:

```dart
PhoneInfo phoneInfos = await Phoneinformations.getPhoneInformation();
```

This method returns a `PhoneInfo` object that contains the following properties:

* `model`: The phone model name.
* `andoidVersion`: The Android version running on the phone.
* `serial`: The device serial number.
* `id`: The device ID.
* `androidId`: The Android ID of the phone.
* `manufacturer`: The manufacturer of the phone.
* `brand`: The brand of the phone.
* `sdkInt`: The SDK version of the Android system.
* `simSerialNumber`: The SIM card serial number.
* `simNumber`: The phone number of the SIM card.
* `subscriberID`: The subscriber ID of the SIM card.
* `networkCountryISO`: The ISO country code of the current network.
* `simCountryISO`: The ISO country code of the SIM card's network.
* `softwareVersion`: The software version of the phone.
* `voiceMailNumber`: The voicemail number.
* `networkType`: The type of network being used.
* `networkGeneration`: The generation of the network being used.
* `cid`: The cell ID of the current network.
* `lac`: The location area code of the current network.
* `simOperator`: The operator of the SIM card.
* `mobileNetworkCode`: The mobile network code of the current network.
* `mobileCountryCode`: The mobile country code of the current network.

**Note**: Some of these properties may be null or empty depending on the phone and the network.

## Example

Here is an example of how to use this plugin :

```dart
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:phoneinformations/phoneinformations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  String mobileNetworkCode = "";
  String mobileCountryCode = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    PhoneInfo phoneInfos;

    try {
      phoneInfos = await Phoneinformations.getPhoneInformation();
      model = phoneInfos.model;
      andoidVersion = phoneInfos.andoidVersion;
      serial = phoneInfos.serial;
      id = phoneInfos.id;
      androidId = phoneInfos.androidId;
      manufacturer = phoneInfos.manufacturer;
      sdkInt = phoneInfos.sdkInt;
      simSerialNumber = phoneInfos.simSerialNumber;
      simNumber = phoneInfos.simNumber;
      subscriberID = phoneInfos.subscriberID;
      networkCountryISO = phoneInfos.networkCountryISO;
      simCountryISO = phoneInfos.simCountryISO;
      mobileNetworkCode = phoneInfos.mobileNetworkCode;
      mobileCountryCode = phoneInfos.mobileCountryCode;
      softwareVersion = phoneInfos.softwareVersion;
      voiceMailNumber = phoneInfos.voiceMailNumber;
      networkType = phoneInfos.networkType;
      networkGeneration = phoneInfos.networkGeneration;
      cid = phoneInfos.cid;
      lac = phoneInfos.lac;
      simOperator = phoneInfos.simOperator;
    } catch (e) {
      print("Failed to get phone infos, error : $e");
    }
    if (!mounted) return;
  
        setState(() {});
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Infos'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Version: $andoidVersion'),
            ),
            Center(
              child: Text('Model: $model'),
            ),
            Center(
              child: Text('sdkInt: $sdkInt'),
            ),
            Center(
              child: Text('id: $id'),
            ),
            Center(
              child: Text('androidId: $androidId'),
            ),
            Center(
              child: Text('Imei: $simSerialNumber'),
            ),
            Center(
              child: Text('PhoneNumber: $simNumber'),
            ),
            Center(
              child: Text('DeviceId: $subscriberID'),
            ),
            Center(
              child: Text('networkCountryISO: $networkCountryISO'),
            ),
            Center(
              child: Text('simOperator: $simOperator'),
            ),
            Center(
              child: Text('mobileNetworkCode: $mobileNetworkCode'),
            ),
            Center(
              child: Text('mobileCountryCode: $mobileCountryCode'),
            ),
            Center(
              child: Text('SIMCountryISO: $simCountryISO'),
            ),
            Center(
              child: Text('softwareVersion: $softwareVersion'),
            ),
            Center(
              child: Text('voiceMailNumber: $voiceMailNumber'),
            ),
            Center(
              child: Text('networkType: $networkType'),
            ),
            Center(
              child: Text('networkGeneration: $networkGeneration'),
            ),
            Center(
              child: Text('cid: $cid'),
            ),
            Center(
              child: Text('lac: $lac'),
            ),
          ],
        ),
      ),
    );
  }
}
```
