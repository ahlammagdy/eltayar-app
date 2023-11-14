import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/get_services.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControllerim extends OnBordingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
