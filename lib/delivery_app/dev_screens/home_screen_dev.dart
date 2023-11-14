import 'dart:io';

import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/delivery_app/dev_controller.dart/home_screen_dev_controller.dart';
import 'package:eltayar/view/widget/home/custom_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevHomeScreen extends StatelessWidget {
  const DevHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DevHomeScreenControllerIM());

    return GetBuilder<DevHomeScreenControllerIM>(
        builder: (controller) => Scaffold(
            bottomNavigationBar: BottomAppBar(
              elevation: 15,
              height: 60,
              shape: const CircularNotchedRectangle(),
              notchMargin: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtomAppbar(
                    icon: Icons.list_alt,
                    name: 'Done Orders',
                    onPressed: () {
                      controller.changePage(0);
                    },
                    active: controller.currentPage == 0 ? true : false,
                  ),
                  CustomButtomAppbar(
                    icon: Icons.alarm_rounded,
                    name: 'Waiting Orders',
                    onPressed: () {
                      controller.changePage(1);
                    },
                    active: controller.currentPage == 1 ? true : false,
                  ),
                  CustomButtomAppbar(
                    icon: Icons.menu,
                    name: 'More',
                    onPressed: () {
                      controller.changePage(2);
                    },
                    active: controller.currentPage == 2 ? true : false,
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
