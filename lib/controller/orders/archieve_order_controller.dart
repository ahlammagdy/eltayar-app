// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/data/model/order_model.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/archieve_orders.dart';

class ArchievedgOrderController extends GetxController {
  List<OrdersModel> archievedOrderDataList = [];
  late StatusRequest statusRequest;
  ArchieveOrderData archievedOrderData = ArchieveOrderData(Get.find());

  @override
  void onInit() {
    getArchievedOrders();
    super.onInit();
  }

  getArchievedOrders() async {
    archievedOrderDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await archievedOrderData.getData();
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List dataResponse = respons['data'];
        archievedOrderDataList
            .addAll(dataResponse.map((e) => OrdersModel.fromJson(e)));
        print(".......archieved come successfully......");
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    }
    update();
  }

  refreshWaitingOrders() {
    getArchievedOrders();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await approval";
    } else if (val == "1") {
      return "being prepared";
    } else if (val == "2") {
      return "assign to delivery";
    } else if (val == "3") {
      return "on the way";
    } else {
      return "done";
    }
  }

  goToOrderDetails() {
    Get.toNamed(AppRoute.orderDetails, arguments: {});
  }
}
