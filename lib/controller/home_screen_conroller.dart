import 'package:eltayar/view/screens/more.dart';
import 'package:eltayar/view/screens/home.dart';
import 'package:eltayar/view/screens/orders/archieved_orders.dart';
import 'package:eltayar/view/screens/orders/waiting_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_route.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
  goToCard();
}

class HomeScreenControllerIM extends HomeScreenController {
  int currentPage = 0;

  List<Widget> pagesList = [
    const Home(),
    const ArchivedOrders(),
    const WaitingOrders(),
    const MorePage()
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  goToCard() {
    Get.toNamed(AppRoute.card);
  }
}
