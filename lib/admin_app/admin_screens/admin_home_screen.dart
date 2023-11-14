import 'dart:io';

import 'package:eltayar/admin_app/admin_controller/admin_home_screen_con.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/view/widget/home/custom_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeScreenControllerIM());

    return GetBuilder<AdminHomeScreenControllerIM>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                controller.goToCard();
              },
              child: const Icon(Icons.shopping_cart),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              elevation: 15,
              height: 60,
              shape: const CircularNotchedRectangle(),
              notchMargin: 7,
              child: Row(
                children: [
                  Row(
                    children: [
                      CustomButtomAppbar(
                        icon: Icons.home,
                        name: 'HomeA',
                        onPressed: () {
                          controller.changePage(0);
                        },
                        active: controller.currentPage == 0 ? true : false,
                      ),
                      CustomButtomAppbar(
                        icon: Icons.list_alt_rounded,
                        name: 'Orders',
                        onPressed: () {
                          controller.changePage(1);
                        },
                        active: controller.currentPage == 1 ? true : false,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomButtomAppbar(
                        icon: Icons.watch_later_outlined,
                        name: 'waiting',
                        onPressed: () {
                          controller.changePage(2);
                        },
                        active: controller.currentPage == 2 ? true : false,
                      ),
                      CustomButtomAppbar(
                        icon: Icons.menu,
                        name: 'More',
                        onPressed: () {
                          controller.changePage(3);
                        },
                        active: controller.currentPage == 3 ? true : false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: WillPopScope(
                child: controller.pagesList.elementAt(controller.currentPage),
                onWillPop: () {
                  Get.defaultDialog(
                      buttonColor: AppColor.primaryColor,
                      title: "تنبيه",
                      middleText: "هل تريد الخروج من التطبيق",
                      onCancel: () {},
                      cancelTextColor: Colors.black,
                      confirmTextColor: Colors.black,
                      onConfirm: () {
                        exit(0);
                      });
                  return Future.value(false);
                })));
  }
}
