// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/orders/waiting_order_controller.dart';

requestPermissionNotification() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("...................notification............");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(
        backgroundColor: Colors.white,
        message.notification!.title!,
        message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("==============page id");
  print(data["pageid"]);
  print("==============page name");
  print(data["pagename"]);
  print("==============current page");
  print(Get.currentRoute);
  if ((Get.currentRoute == "/homescreen" ||
          Get.currentRoute == "/adminHomeScreen" ||
          Get.currentRoute == "/devHomeScreen") &&
      data['pagename'] == "waitingorderrefresh") {
    WaitingOrderController controlleradmin = Get.put(WaitingOrderController());
    WaitingOrderController controllerdev = Get.put(WaitingOrderController());
    controlleradmin.refreshWaitingOrders();
    controllerdev.refreshWaitingOrders();
  }
}
