// ignore_for_file: body_might_complete_normally_nullable

import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // -----------admin --------------
    if (myServices.sharedPreferences.getString("user_role") == "Admin") {
      if (myServices.sharedPreferences.getString("step") == "2") {
        return const RouteSettings(name: AppRoute.adminHomeScreen);
      }
      if (myServices.sharedPreferences.getString("step") == "1") {
        return const RouteSettings(name: AppRoute.login);
      }
    }

//---------------call center---------------
    if (myServices.sharedPreferences.getString("user_role") == "Call Center") {
      if (myServices.sharedPreferences.getString("step") == "2") {
        return const RouteSettings(name: AppRoute.homeScreen);
      }
      if (myServices.sharedPreferences.getString("step") == "1") {
        return const RouteSettings(name: AppRoute.login);
      }
    }

//-------------tayar-----------------
    if (myServices.sharedPreferences.getString("user_role") == "Tayar") {
      if (myServices.sharedPreferences.getString("step") == "2") {
        return const RouteSettings(name: AppRoute.devHomeScreen);
      }
      if (myServices.sharedPreferences.getString("step") == "1") {
        return const RouteSettings(name: AppRoute.login);
      }
    }
  }
}
