// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/auth/singup_data.dart';

abstract class SingupController extends GetxController {
  singup(String userRole);
  goToLogin();
}

class SingupControllerIM extends SingupController {
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  bool isShowPass = true;
  SingUpData singupData = SingUpData(Get.find());

  List data = [];

  String dropdownuserrole = 'choose role';

  setDropValue(String? newValue) {
    dropdownuserrole = newValue!;
    update();
  }

  @override
  singup(userRole) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (userRole == 'choose role') {
        Get.rawSnackbar(
            title: "تنبيه",
            messageText: const Text(
              "الرجاء اختيار دور المستخدم",
              style: TextStyle(color: Colors.white),
            ));
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var respons = await singupData.postData(usernameController.text,
            phoneController.text, passwordController.text, dropdownuserrole);
        statusRequest = handlingData(respons);
        if (StatusRequest.success == statusRequest) {
          if (respons['status'] == "success") {
            print("success =================================");
            //data.addAll(respons['data']);
            Get.rawSnackbar(
                title: "تنبيه",
                messageText: const Text(
                  "تم اضافة المستخدم بنجاح",
                  style: TextStyle(color: Colors.white),
                ));
            Get.offAllNamed(AppRoute.adminHomeScreen);
          } else {
            Get.defaultDialog(
                title: "Warning", middleText: "phone number already exist");
            statusRequest = StatusRequest.noDatafailur;
          }
        }
        update();
        print("valid");
      }
    } else {
      print("not valid");
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
