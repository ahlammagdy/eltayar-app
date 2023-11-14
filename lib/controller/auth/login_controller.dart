// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/get_services.dart';
import '../../data/data_source/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login();
  goToSingup();
  goToForgetPassword();
}

class LogingControllerIM extends LoginController {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowPass = true;
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      update();
      var respons = await loginData.postData(
          phoneController.text, passwordController.text);
      var statusRequest = handlingData(respons);
      if (StatusRequest.success == statusRequest) {
        if (respons['status'] == "success") {
          print("success========================================");
          myServices.sharedPreferences
              .setString("user_id", respons["data"]["user_id"].toString());
          String userid = myServices.sharedPreferences.getString("user_id")!;
          myServices.sharedPreferences
              .setString("username", respons['data']['user_name']);
          myServices.sharedPreferences.setString("step", "2");
          myServices.sharedPreferences
              .setString("phone", respons['data']['phone']);
          myServices.sharedPreferences
              .setString("user_role", respons['data']['user_role']);

//------------log in type ------------------------
          if (respons['data']['user_role'] == "Admin") {
            FirebaseMessaging.instance.subscribeToTopic("admin");
            FirebaseMessaging.instance.subscribeToTopic("users");
            Get.offNamed(AppRoute.adminHomeScreen);
          } else if (respons['data']['user_role'] == "Call Center") {
            //FirebaseMessaging.instance.subscribeToTopic("admincallusers");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");
            FirebaseMessaging.instance.subscribeToTopic("users");

            Get.offNamed(AppRoute.homeScreen);
          } else {
            FirebaseMessaging.instance.subscribeToTopic("delivery");
            FirebaseMessaging.instance.subscribeToTopic("users");

            Get.offNamed(AppRoute.devHomeScreen);
          }
//------------end login type-------------------
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "phone number or password not correct");
          statusRequest = StatusRequest.noDatafailur;
        }
      }

      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  goToSingup() {
    Get.offNamed(AppRoute.singup);
  }

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      // ignore: unused_local_variable
      String? token = value;
    });
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }
}
