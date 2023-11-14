import 'package:eltayar/admin_app/admin_screens/admin_more_screens.dart';
import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/view/screens/home.dart';
import 'package:eltayar/view/screens/orders/archieved_orders.dart';
import 'package:eltayar/view/screens/orders/waiting_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AdminHomeScreenController extends GetxController {
  changePage(int i);
  goToCard();
}

class AdminHomeScreenControllerIM extends AdminHomeScreenController {
  int currentPage = 0;

  List<Widget> pagesList = [
    const Home(),
    const ArchivedOrders(),
    const WaitingOrders(),
    const AdminMorePage()
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
