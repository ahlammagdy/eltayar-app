// ignore_for_file: avoid_print

import 'package:eltayar/core/class/status_request.dart';
import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/data/data_source/remote/card_data.dart';
import 'package:eltayar/data/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handling_data.dart';

abstract class CardController extends GetxController {
  add(String itemid);
  delete(String itemid);
  //getCountCardItem(String itemid);
  refreshPage();
  view();
}

class CardControllerIM extends CardController {
  CardData cardData = CardData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<CardModel> data = [];

  @override
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
    refreshPage();
    update();
  }

  @override
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
    refreshPage();
    update();
  }

  @override
  @override
  void onInit() {
    itemNote = TextEditingController();
    view();
    super.onInit();
  }

  @override
  refreshPage() {
    data.clear();
    view();
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cardData
        .viewCard(myServices.sharedPreferences.getString("user_id")!);
    print("======================Success====getcount==============");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["cardItems"]['status'] == "success") {
        List dataResponse = response["cardItems"]['data'];
        data.clear();
        data.addAll(dataResponse.map((e) => CardModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }

//--------order note

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? itemNote;
  validItemNote(val) {
    if (val.isEmpty) {
      val = " ";
    }
  }

//-------------order typr---------------

  String dropdownordertype = 'choose type';

  setDropValue(String? newValue) {
    dropdownordertype = newValue!;
    update();
  }

  gotoAddress(String ordertype) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (ordertype == 'choose type') {
        Get.rawSnackbar(
            title: "تنبيه",
            messageText: const Text(
              "الرجاء اختيار نوع الطلبيه",
              style: TextStyle(color: Colors.white),
            ));
      } else if (data.isEmpty) {
        Get.rawSnackbar(
            title: "تنبيه",
            messageText: const Text(
              "السلة فارغة",
              style: TextStyle(color: Colors.white),
            ));
      } else {
        Get.toNamed(AppRoute.address, arguments: {
          'ordertype': dropdownordertype,
          'ordernote': itemNote!.text
        });
      }
    }
  }
}
