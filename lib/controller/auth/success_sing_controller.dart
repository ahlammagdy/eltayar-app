import 'package:eltayar/core/constant/app_route.dart';
import 'package:get/get.dart';

abstract class SuccessSingController extends GetxController {
  goToLogin();
}

class SuccessSingControllerIM extends SuccessSingController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
