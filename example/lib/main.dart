

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

  // Platform messages are asynchronous, so we initialize in an async method.
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

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
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
