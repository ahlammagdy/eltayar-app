import 'package:eltayar/core/class/status_request.dart';
import 'package:eltayar/data/data_source/remote/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/handling_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var respons = await testData.getData();
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        data.addAll(respons['data']);
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
