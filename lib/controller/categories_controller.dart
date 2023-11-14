// ignore_for_file: avoid_print

import 'package:eltayar/data/data_source/remote/categories_data.dart';
import 'package:eltayar/data/model/categories_model.dart';
import 'package:eltayar/data/model/order_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eltayar/core/constant/app_route.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';

abstract class CategoriesController extends GetxController {
  initialData();
  changeType(int val, String typeid);
  getCategories(String orderTypeid);
  getOrderTypeName(String ordertypeid);
  goToItems(categories, selectedCat, categoryid);
}

class CategoriesControllerIM extends CategoriesController {
  List ordersTypes = [];
  List categories = [];
  late String orderTypeid;
  late int selectedtype;
  late StatusRequest statusRequest;
  late OrderTypeModel orderTypeModel;
  CategoriesData categoriesData = CategoriesData(Get.find());

  TextEditingController? searchController;
  List<CategoriesModel> listCatSearch = [];

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    getCategories(orderTypeid);
    super.onInit();
  }

  @override
  initialData() {
    ordersTypes = Get.arguments["orderTypes"];
    selectedtype = Get.arguments["selectedtype"];
    orderTypeid = Get.arguments["orderTypeid"];
  }

  @override
  changeType(val, typeid) {
    selectedtype = val;
    orderTypeid = typeid;
    getCategories(orderTypeid);
    update();
  }

  @override
  getCategories(String orderTypeid) async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    var respons = await categoriesData.getData(orderTypeid);
    print("========get category function==============");
    statusRequest = handlingData(respons);

    if (StatusRequest.success == statusRequest) {
      if (respons['categories']['status'] == "success") {
        categories.addAll(respons['categories']["data"]);
        print("=====categories is loaded successfully");
        print(respons['categories']["data"]);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.myItems, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoryid": categoryid
    });
  }

  @override
  getOrderTypeName(String ordertypeid) {}

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
    catSearch();
    update();
  }

  catSearch() async {
    statusRequest = StatusRequest.loading;
    var respons = await categoriesData.searchCatData(searchController!.text);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        listCatSearch.clear();
        List catListSearch = respons['data'];
        listCatSearch
            .addAll(catListSearch.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }
}
