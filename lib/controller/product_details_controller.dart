// ignore_for_file: avoid_print

import 'package:eltayar/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/constant/app_route.dart';
import '../core/functions/handling_data.dart';
import '../core/services/get_services.dart';
import '../data/data_source/remote/card_data.dart';
import '../data/model/card_model.dart';

abstract class ProductDetailsController extends GetxController {
  addcount();
  removecount();
  goToCard();
}

class ProductDetailsControllerIM extends ProductDetailsController {
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  var count = 0;
  CardData cardData = CardData(Get.find());
  MyServices myServices = Get.find();
  List<CardModel> data = [];

  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsModel"];
    count = await getCountCardItem(itemsModel.itemId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  add(itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cardData.addCard(
        myServices.sharedPreferences.getString("user_id")!, itemid);
    print("======================Success==================");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text(
              "تم اضافة المنتج الى السله",
              style: TextStyle(color: Colors.white),
            ));
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }

    update();
  }

  delete(itemid) async {
    statusRequest = StatusRequest.loading;

    var response = await cardData.deleteCard(
        myServices.sharedPreferences.getString("user_id")!, itemid);
    print("======================Success==================");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text(
              "تم ازالة المنتج من السله",
              style: TextStyle(color: Colors.white),
            ));
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }

  getCountCardItem(itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cardData.getCountCard(
        myServices.sharedPreferences.getString("user_id")!, itemid);
    print("======================Success====getcount==============");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response['data']);
        var count = 0;
        count = response['data'];
        print("===========$count=============");
        return count;
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }

    update();
  }

  @override
  addcount() {
    add(itemsModel.itemId.toString());
    count++;
    update();
  }

  @override
  removecount() {
    if (count > 0) {
      delete(itemsModel.itemId.toString());
      count--;
    }
    update();
  }

  @override
  goToCard() {
    Get.offNamed(AppRoute.card);
  }
}
