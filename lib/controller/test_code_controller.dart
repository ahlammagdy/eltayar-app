// ignore_for_file: avoid_print

import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/data/model/order_model.dart';
import 'package:eltayar/delivery_app/dev_data/dev_waiting_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';

class TestController extends GetxController {
  List<OrdersModel> devWaitingDataList = [];
  late StatusRequest statusRequest;
  DevWaitingData devWaitingData = DevWaitingData(Get.find());
  MyServices myServices = Get.find();
  @override
  void onInit() {
    getDevWaiting();
    super.onInit();
  }

  getDevWaiting() async {
    print("=====iam in get data ======");
    devWaitingDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await devWaitingData.getData();
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List dataResponse = respons['data'];
        devWaitingDataList
            .addAll(dataResponse.map((e) => OrdersModel.fromJson(e)));
        print(".......dev waiting come successfully......");
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("======iam not in dev waiting orders =======");
    }
    update();
  }

  getApprove(String orderid, String userid) async {
    print("=====iam in get data ======");
    devWaitingDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await devWaitingData.getApprovedData(
        orderid,
        userid,
        myServices.sharedPreferences.getString("username")!,
        myServices.sharedPreferences.getString("user_id")!);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        print(".......dev waiting come successfully......");
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("======iam not in dev waiting orders =======");
    }
    update();
  }

  refreshWaitingOrders() {
    getDevWaiting();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await approval";
    } else if (val == "1") {
      return "being prepared";
    } else if (val == "2") {
      return "ready to delivery";
    } else if (val == "3") {
      return "on the way";
    } else {
      return "archived";
    }
  }

  List listOfIDs = [];

  getApproveForArchieve(String orderid, String userid) async {
    print("=====iam in get data ======");
    devWaitingDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await devWaitingData.getApprovedData(
        orderid,
        userid,
        myServices.sharedPreferences.getString("username")!,
        myServices.sharedPreferences.getString("user_id")!);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        print(".......dev waiting come successfully......");
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("======iam not in dev waiting orders =======");
    }
    update();
  }

  getApproveForKing(String orderid, String userid) async {
    print("=====iam in get data ======");
    devWaitingDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await devWaitingData.getApprovedData(
        orderid,
        userid,
        myServices.sharedPreferences.getString("username")!,
        myServices.sharedPreferences.getString("user_id")!);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        print(".......dev waiting come successfully......");
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("======iam not in dev waiting orders =======");
    }
    update();
  }
}
