// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/data/data_source/remote/waiting_order_data.dart';
import 'package:eltayar/data/model/order_model.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';

class WaitingOrderController extends GetxController {
  List<OrdersModel> waitingOrderDataList = [];
  late StatusRequest statusRequest;
  WaitingOrderData waitingOrderData = WaitingOrderData(Get.find());

  @override
  void onInit() {
    getWaitingOrders();
    super.onInit();
  }

  getWaitingOrders() async {
    waitingOrderDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await waitingOrderData.getData();
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List dataResponse = respons['data'];
        waitingOrderDataList
            .addAll(dataResponse.map((e) => OrdersModel.fromJson(e)));
        print(".......waiting come successfully......");
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("======iam not in waiting orders =======");
    }
    update();
  }

  refreshWaitingOrders() {
    getWaitingOrders();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await approval";
    } else if (val == "1") {
      return "being prepared";
    } else if (val == "2") {
      return "ready to delivery";
    } else if (val == "3") {
      return "taken by tayar";
    } else {
      return "wait confirm";
    }
  }

  goToOrderDetails() {
    Get.toNamed(AppRoute.orderDetails, arguments: {});
  }
}
