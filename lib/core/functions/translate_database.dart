import 'package:eltayar/core/services/get_services.dart';
import 'package:get/get.dart';

translateDatabase(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("language") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
