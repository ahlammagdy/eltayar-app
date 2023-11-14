// ignore_for_file: avoid_print

import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/data/model/order_model.dart';
import 'package:eltayar/delivery_app/dev_data/dev_accepted_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';

class DevAcceptedController extends GetxController {
  List<OrdersModel> devAcceptedDataList = [];
  late StatusRequest statusRequest;
  DevAcceptedData devAcceptedData = DevAcceptedData(Get.find());
  MyServices myServices = Get.find();
  @override
  void onInit() {
    getDevAccepted();
    super.onInit();
  }

  getDevAccepted() async {
    devAcceptedDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await devAcceptedData
        .getData(myServices.sharedPreferences.getString("user_id")!);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        List dataResponse = respons['data'];
        devAcceptedDataList
            .addAll(dataResponse.map((e) => OrdersModel.fromJson(e)));
        print(".......dev Accepted come successfully......");
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("======iam not in dev accepted orders =======");
    }
    update();
  }

  getDevDone(String userid, String orderid) async {
    print("======iam in dev done orders =======");

    devAcceptedDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respons = await devAcceptedData.getDone(userid, orderid);
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        print(".......dev done come successfully......");
        getDevAccepted();
        // print(respons['data']);
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("======iam not in dev done orders =======");
    }
    update();
  }

  refreshWaitingOrders() {
    getDevAccepted();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await approval";
    } else if (val == "1") {
      return "being prepared";
    } else if (val == "2") {
      return "on the way";
    } else {
      return "wait confirm";
    }
  }

  goToOrderDetails() {
    Get.toNamed(AppRoute.orderDetails, arguments: {});
  }
}
