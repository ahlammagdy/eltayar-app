import 'package:eltayar/core/services/get_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../functions/fcm_config.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    Get.updateLocale(locale);
  }

  requestPermisionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمة الموقع");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية تشغيل الموقع");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استخدام التطبيق بدون تشغيل الموقع");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestPermisionLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
