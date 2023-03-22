package com.komche.phoneinformations;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.HashMap;
import android.content.Context;
import android.app.Activity;
import android.telephony.TelephonyManager;
import android.telephony.CellInfo;
import android.telephony.CellInfoGsm;
import android.telephony.CellInfoCdma;
import android.telephony.CellLocation;
import android.telephony.cdma.CdmaCellLocation;
import android.telephony.gsm.GsmCellLocation;
import java.lang.Double;
import android.util.Log;
import java.util.List;

import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.provider.Settings;

/** PhoneinformationsPlugin */
public class PhoneinformationsPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native
  /// Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine
  /// and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;
  private Context context;
  private ContentResolver contentResolver;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "phoneinformations");
    channel.setMethodCallHandler(this);
    this.context = flutterPluginBinding.getApplicationContext();
    this.contentResolver = flutterPluginBinding.getApplicationContext().getContentResolver();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getPhoneInformations")) {
      String model = android.os.Build.MODEL;
      String andoidVersion = android.os.Build.VERSION.RELEASE;
      String sdkInt = android.os.Build.VERSION.SDK_INT + "";
      String serial = android.os.Build.SERIAL;
      String id = android.os.Build.ID;
      String manufacturer = android.os.Build.MANUFACTURER;
      String brand = android.os.Build.BRAND;
      String type = android.os.Build.TYPE;
      String user = android.os.Build.USER;

      TelephonyManager telephonyManager = (TelephonyManager) activity.getSystemService(Context.TELEPHONY_SERVICE);
      double release = Double.parseDouble(andoidVersion.replaceAll("(\\d+[.]\\d+)(.*)", "$1"));
      Log.d("log", "" + release);

      String simSerialNumber = "notfound";
      String subscriberID = "notfound";
      if (release < 10) {
        simSerialNumber = telephonyManager.getSimSerialNumber();
        subscriberID = telephonyManager.getDeviceId();
      }

      String simNumber = telephonyManager.getLine1Number();
      String simOperator = telephonyManager.getSimOperatorName();
      String mobileNetworkCode = telephonyManager.getSimOperator().substring(3);
      String mobileCountryCode = telephonyManager.getSimOperator().substring(0,3);
      String networkCountryISO = telephonyManager.getNetworkCountryIso();
      String SIMCountryISO = telephonyManager.getSimCountryIso();
      String softwareVersion = telephonyManager.getDeviceSoftwareVersion();
      String voiceMailNumber = telephonyManager.getVoiceMailNumber();

      HashMap<String, Object> locationInfo = getCellInfo(telephonyManager);

      String cid = "0";
      String lac = "0";

      if (locationInfo.get("cid") != null)
        cid = locationInfo.get("cid").toString();
      if (locationInfo.get("lac") != null)
        lac = locationInfo.get("lac").toString();

      HashMap<String, Object> phoneInfo = new HashMap<>();
      phoneInfo.put("model", model);
      phoneInfo.put("andoidVersion", andoidVersion);
      phoneInfo.put("serial", serial);
      phoneInfo.put("id", id);
      phoneInfo.put("androidId", getAndroidId());
      phoneInfo.put("manufacturer", manufacturer);
      phoneInfo.put("brand", brand);
      phoneInfo.put("sdkInt", sdkInt);

      phoneInfo.put("simSerialNumber", simSerialNumber);
      phoneInfo.put("simNumber", simNumber);
      phoneInfo.put("subscriberID", subscriberID);
      phoneInfo.put("networkCountryISO", networkCountryISO);
      phoneInfo.put("simCountryISO", SIMCountryISO);
      phoneInfo.put("softwareVersion", softwareVersion);
      phoneInfo.put("voiceMailNumber", voiceMailNumber);
      phoneInfo.put("networkType", networkType(telephonyManager));
      phoneInfo.put("networkGeneration", networkGeneration(telephonyManager));
      phoneInfo.put("cid", cid);
      phoneInfo.put("lac", lac);
      phoneInfo.put("simOperator", simOperator);
      phoneInfo.put("mobileNetworkCode", mobileNetworkCode);
      phoneInfo.put("mobileCountryCode", mobileCountryCode);

      result.success(phoneInfo);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onDetachedFromActivity() {
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    // The Activity your plugin was associated with has been
    // destroyed due to config changes. It will be right back
    // but your plugin must clean up any references to that
    // Activity and associated resources.
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @SuppressLint("HardwareIds")
  private String getAndroidId() {
    return Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID);
  }

  private String networkType(TelephonyManager teleMan) {
    int networkType = teleMan.getNetworkType();
    switch (networkType) {
      case TelephonyManager.NETWORK_TYPE_1xRTT:
        return "1xRTT";
      case TelephonyManager.NETWORK_TYPE_CDMA:
        return "CDMA";
      case TelephonyManager.NETWORK_TYPE_EDGE:
        return "EDGE";
      case TelephonyManager.NETWORK_TYPE_EHRPD:
        return "eHRPD";
      case TelephonyManager.NETWORK_TYPE_EVDO_0:
        return "EVDO rev. 0";
      case TelephonyManager.NETWORK_TYPE_EVDO_A:
        return "EVDO rev. A";
      case TelephonyManager.NETWORK_TYPE_EVDO_B:
        return "EVDO rev. B";
      case TelephonyManager.NETWORK_TYPE_GPRS:
        return "GPRS";
      case TelephonyManager.NETWORK_TYPE_HSDPA:
        return "HSDPA";
      case TelephonyManager.NETWORK_TYPE_HSPA:
        return "HSPA";
      case TelephonyManager.NETWORK_TYPE_HSPAP:
        return "HSPA+";
      case TelephonyManager.NETWORK_TYPE_HSUPA:
        return "HSUPA";
      case TelephonyManager.NETWORK_TYPE_IDEN:
        return "iDen";
      case TelephonyManager.NETWORK_TYPE_LTE:
        return "LTE";
      case TelephonyManager.NETWORK_TYPE_UMTS:
        return "UMTS";
      case TelephonyManager.NETWORK_TYPE_UNKNOWN:
        return "Unknown";
    }
    throw new RuntimeException("New type of network");
  }

  private String networkGeneration(TelephonyManager teleMan) {
    int networkType = teleMan.getNetworkType();
    switch (networkType) {
      case TelephonyManager.NETWORK_TYPE_UNKNOWN:
        return "Unknown network";
      case TelephonyManager.NETWORK_TYPE_GSM:
        return "GSM";
      case TelephonyManager.NETWORK_TYPE_CDMA:
      case TelephonyManager.NETWORK_TYPE_1xRTT:
      case TelephonyManager.NETWORK_TYPE_IDEN:
        return "2G";
      case TelephonyManager.NETWORK_TYPE_GPRS:
        return "GPRS (2.5G)";
      case TelephonyManager.NETWORK_TYPE_EDGE:
        return "EDGE (2.75G)";
      case TelephonyManager.NETWORK_TYPE_UMTS:
      case TelephonyManager.NETWORK_TYPE_EVDO_0:
      case TelephonyManager.NETWORK_TYPE_EVDO_A:
      case TelephonyManager.NETWORK_TYPE_EVDO_B:
        return "3G";
      case TelephonyManager.NETWORK_TYPE_HSPA:
      case TelephonyManager.NETWORK_TYPE_HSDPA:
      case TelephonyManager.NETWORK_TYPE_HSUPA:
        return "H (3G+)";
      case TelephonyManager.NETWORK_TYPE_EHRPD:
      case TelephonyManager.NETWORK_TYPE_HSPAP:
      case TelephonyManager.NETWORK_TYPE_TD_SCDMA:
        return "H+ (3G++)";
      case TelephonyManager.NETWORK_TYPE_LTE:
      case TelephonyManager.NETWORK_TYPE_IWLAN:
        return "4G";
    }
    throw new RuntimeException("New type of network");
  }

  private HashMap<String, Object> getCellInfo(TelephonyManager telephonyManager) {
    int cid = 0, lac = 0;
    HashMap<String, Object> locationInfo = new HashMap<>();

    try {
      CellLocation cellLocation = telephonyManager.getCellLocation();
      // CellLocation location = CellLocationSingleData.fromCellInfo(cellLocation);
      if (cellLocation instanceof GsmCellLocation) {
        cid = ((GsmCellLocation) cellLocation).getCid();
        lac = ((GsmCellLocation) cellLocation).getLac();
      } else if (cellLocation instanceof CdmaCellLocation) {
        cid = ((CdmaCellLocation) cellLocation).getBaseStationId();
        lac = ((CdmaCellLocation) cellLocation).getSystemId();
      } 
      locationInfo.put("cid", cid);
      locationInfo.put("lac", lac);
      return locationInfo;
    } catch (Exception e) {
      List<CellInfo> cellInfoList = telephonyManager.getAllCellInfo();
      if (cellInfoList != null) {
        for (CellInfo cellInfo : cellInfoList) {
          // if (cellInfo.isRegistered()) {
          if (cellInfo instanceof CellInfoGsm) {
            cid = ((CellInfoGsm) cellInfo).getCellIdentity().getCid();
            lac = ((CellInfoGsm) cellInfo).getCellIdentity().getLac();
          } else if (cellInfo instanceof CellInfoCdma) {
            cid = ((CellInfoCdma) cellInfo).getCellIdentity().getBasestationId();
            lac = ((CellInfoCdma) cellInfo).getCellIdentity().getSystemId();
          }
          // }
        }
        locationInfo.put("cid", cid);
        locationInfo.put("lac", lac);
        return locationInfo;
      }
    }

    // if (android.os.Build.VERSION.SDK_INT >=
    // android.os.Build.VERSION_CODES.JELLY_BEAN_MR1) {

    // } else {

    // }
    locationInfo.put("cid", cid);
    locationInfo.put("lac", lac);
    return locationInfo;
  }
}
