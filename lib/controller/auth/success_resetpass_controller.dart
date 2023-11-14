import 'package:eltayar/core/constant/app_route.dart';
import 'package:get/get.dart';

abstract class SuccessResetPassController extends GetxController {
  goToLogin();
}

class SuccessResetPassControllerIM extends SuccessResetPassController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
