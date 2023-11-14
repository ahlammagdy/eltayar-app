// ignore_for_file: avoid_print

import 'package:eltayar/core/class/status_request.dart';
import 'package:eltayar/core/functions/handling_data.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/data/data_source/remote/notifications.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  NotificationsData testData = NotificationsData(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  getData() async {
    statusRequest = StatusRequest.loading;
    var respons = await testData
        .getData(myServices.sharedPreferences.getString("user_id"));
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        data.addAll(respons['data']);
        print("==========notifications come successfully=============");
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
