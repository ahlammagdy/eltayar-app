import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/link_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AdminMoreController extends GetxController {
  logOut();
  addNewUser();
  goToReports();
}

class AdminMoreControllerIM extends AdminMoreController {
  MyServices myServices = Get.find();

  @override
  logOut() {
    String userid = myServices.sharedPreferences.getString("user_id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppLink.login);
  }

  @override
  addNewUser() {
    Get.toNamed(AppRoute.singup);
  }

  conectUs() {
    launchUrl(Uri.parse("tel:+201151016336"));
  }

  @override
  goToReports() {
    Get.toNamed(AppRoute.reports);
  }
}
