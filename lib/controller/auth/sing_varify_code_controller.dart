import 'package:eltayar/core/constant/app_route.dart';
import 'package:get/get.dart';

abstract class SingVarifyCodeController extends GetxController {
  checkCode();
  goToSuccessSing();
}

class SingVarifyCodeControllerIM extends SingVarifyCodeController {
  late String varifyCode;

  @override
  checkCode() {
    Get.offNamed(AppRoute.successSingup);
  }

  @override
  goToSuccessSing() {
    Get.offNamed(AppRoute.successSingup);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
