// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessReset();
}

class ResetPasswordControllerIM extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  resetPassword() {
    var formDate = formKey.currentState;
    if (formDate!.validate()) {
      print("valid");
      Get.offNamed(AppRoute.successResetPassword);
    } else {
      print("not valid");
    }
  }

  @override
  goToSuccessReset() {
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}
