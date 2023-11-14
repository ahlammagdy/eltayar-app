import 'package:eltayar/delivery_app/dev_screens/dev_wait.dart';
import 'package:eltayar/delivery_app/dev_screens/orders_home.dart';
import 'package:eltayar/delivery_app/dev_screens/tayar_more.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DevHomeScreenController extends GetxController {
  changePage(int i);
}

class DevHomeScreenControllerIM extends DevHomeScreenController {
  int currentPage = 0;

  List<Widget> pagesList = [
    const DevOrderHome(),
    const DevWaitingOrders(),
    const TayarMore(),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
