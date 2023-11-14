// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPassword extends GetxController {
  checkEmail();
  goToVirifyCode();
}

class ForgetPasswordIM extends ForgetPassword {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  checkEmail() {
    var formDate = formKey.currentState;
    if (formDate!.validate()) {
      print("valid");
      Get.offNamed(AppRoute.resetPassword);
    } else {
      print("not valid");
    }
  }

  @override
  goToVirifyCode() {
    Get.offNamed(AppRoute.varifyCode);
  }

  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }
}
