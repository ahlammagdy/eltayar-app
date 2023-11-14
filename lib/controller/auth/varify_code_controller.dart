import 'package:eltayar/core/constant/app_route.dart';
import 'package:get/get.dart';

abstract class VarifyCodeController extends GetxController {
  checkCode();
  goToRestPassword();
}

class VarifyCodeControllerIM extends VarifyCodeController {
  late String varifyCode;
  @override
  checkCode() {}

  @override
  goToRestPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
