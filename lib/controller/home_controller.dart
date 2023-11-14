// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/data/data_source/remote/home_data.dart';
import 'package:eltayar/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';

abstract class HomeController extends GetxController {
  inintialData();
  getData();
  gotoMyCategories(orderTypes, selectedtype, orderTypeid);
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerIM extends HomeController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  List items = [];
  List categories = [];
  List ordersTypes = [];
  TextEditingController? searchController;
  List<ItemsModel> listItemsSearch = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late StatusRequest statusRequest;
  String? username;
  String? userID;
  @override
  inintialData() {
    username = myServices.sharedPreferences.getString('username');
    userID = myServices.sharedPreferences.getString('user_id');
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    inintialData();
    getData();
    super.onInit();
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
    update();
    isSearch = true;
    itemsSearch();
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var respons = await homeData.getData();
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        categories.addAll(respons['categories']['data']);
        items.addAll(respons['items']["data"]);
        ordersTypes.addAll(respons['ordersTypes']['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }

  itemsSearch() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      update();
      statusRequest = StatusRequest.loading;
      listItemsSearch.clear();
      var respons = await homeData.searchData(searchController!.text);
      statusRequest = handlingData(respons);
      if (StatusRequest.success == statusRequest) {
        if (respons['status'] == "success") {
          listItemsSearch.clear();
          List itemsSearch = respons['data'];
          listItemsSearch
              .addAll(itemsSearch.map((e) => ItemsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.noDatafailur;
        }
      }
      update();
    } else {
      print("invalid search");
    }
  }

  validSearch(val) {
    if (val.isEmpty) {
      return "can't be empty";
    }
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
  gotoMyCategories(orderTypes, selectedtype, orderTypeid) {
    Get.toNamed(AppRoute.myCategories, arguments: {
      "orderTypes": ordersTypes,
      "selectedtype": selectedtype,
      "orderTypeid": orderTypeid,
    });
  }

  goToItemsDetails(itemsModel) {
    Get.toNamed("productDetails", arguments: {"itemsModel": itemsModel});
  }

  gotoNotifications() {
    Get.toNamed(AppRoute.notifications);
  }
}
