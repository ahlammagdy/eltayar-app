import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/data/data_source/remote/items_data.dart';
import 'package:eltayar/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/data_source/remote/home_data.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catid);
  getItems(String categoryid);
  goToItemsDetails(ItemsModel itemsModel);
  // addcount(index);
  // removecount(index);
  goToCard();
}

class ItemsControllerIM extends ItemsController {
  List categories = [];
  late int selectedCat;
  late String categoryid;
  List data = [];
  TextEditingController? searchController;
  List<ItemsModel> listItemsSearch = [];
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  ItemsData itemsData = ItemsData(Get.find());

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    getItems(categoryid);
    super.onInit();
  }

  @override
  initialData() async {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    categoryid = Get.arguments["categoryid"];
  }

  @override
  changeCat(val, catid) {
    selectedCat = val;
    categoryid = catid;
    getItems(categoryid);
    update();
  }

  @override
  getItems(String categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var respons = await itemsData.getData(categoryid);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['items']['status'] == "success") {
        data.addAll(respons['items']['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed("productDetails", arguments: {"itemsModel": itemsModel});
  }

  @override
  goToCard() {
    Get.toNamed(AppRoute.card);
  }

  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onsearchIcon() {
    isSearch = true;
    itemsSearch();
    update();
  }

  itemsSearch() async {
    statusRequest = StatusRequest.loading;
    var respons = await homeData.searchData(searchController!.text);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        listItemsSearch.clear();
        List itemsSearch = respons['data'];
        listItemsSearch.addAll(itemsSearch.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }
}
