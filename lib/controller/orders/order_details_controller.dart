// ignore_for_file: avoid_print

import 'dart:async';

import 'package:eltayar/data/data_source/remote/order_details.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../data/model/card_model.dart';
import '../../data/model/order_model.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel waitingOrdersModel;

  List<Marker> marker = [];

  double? lat;
  double? lang;

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  CameraPosition? cameraPosition;

  initialData() {
    cameraPosition = CameraPosition(
      target: LatLng(
          waitingOrdersModel.addressLat!, waitingOrdersModel.addressLng!),
      zoom: 14.4746,
    );
    marker.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(
            waitingOrdersModel.addressLat!, waitingOrdersModel.addressLng!)));
  }

  @override
  void onInit() {
    waitingOrdersModel = Get.arguments['waitingOrderModel'];
    initialData();
    getData();
    super.onInit();
  }

  OrderDetailData orderDetailData = OrderDetailData(Get.find());

  List<CardModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var respons =
        await orderDetailData.getData(waitingOrdersModel.orderId.toString());
    statusRequest = handlingData(respons);
    if (StatusRequest.success == statusRequest) {
      if (respons['status'] == "success") {
        print(
            "the order details data come successfully=======================");
        List dataResponse = respons['data'];
        data.addAll(dataResponse.map((e) => CardModel.fromJson(e)));
        //.addAll(respons['data']);
        print(
            "the order details data come successfully=======================");
      } else {
        statusRequest = StatusRequest.noDatafailur;
      }
    } else {
      print("=====i am not in the order details data =======================");
    }
    update();
  }
}
