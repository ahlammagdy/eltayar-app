// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:eltayar/core/class/status_request.dart';
import 'package:eltayar/core/functions/handling_data.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/data/data_source/remote/add_orders.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../core/constant/app_route.dart';

class AddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

// ---------------address details
  TextEditingController? addressDetails;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validAddressDetails(val) {
    if (val.isEmpty) {
      return "can't be empty";
    }
  }

//---------address on map------------------

  List<Marker> marker = [];

  double? lat;
  double? lang;

  addMarkers(LatLng latLng) {
    marker.clear();
    marker.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    lang = latLng.longitude;
    update();
  }

  Position? position;

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    ordertype = Get.arguments['ordertype'];
    ordernote = Get.arguments['ordernote'];
    print("%%%%%%%---the order type is----$ordertype----");
    print("%%%%%%%---the order note is----$ordernote----");

    addressDetails = TextEditingController();
    searchController = TextEditingController();
    getCurrentLocation();
    super.onInit();
  }

//--------------search on address------------

  TextEditingController? searchController;

  Future<LatLng?> getLatLngFromPlaceId(String placeId) async {
    const apiKey = "AIzaSyDQqYtE4CPjA30M13Vq9c3kJzP1njZ5Mmg";
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['result'];
      final geometry = results['geometry'];
      final location = geometry['location'];

      final double lat = location['lat'];
      final double lng = location['lng'];

      return LatLng(lat, lng);
    }

    return null;
  }

  void moveCameraToLocation(LatLng latLng) async {
    final GoogleMapController controller = await mapController.future;
    controller.moveCamera(
      CameraUpdate.newLatLngZoom(latLng, 14.0),
    );
    update();
  }

//--------------funtions--------------------

  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  sendOrder() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (lat == null || lang == null) {
        Get.rawSnackbar(
            title: "تنبيه",
            messageText: const Text(
              "حدد الموقع على الخريطة",
              style: TextStyle(color: Colors.white),
            ));
      } else {
        print("%%%%%%%---the order type is----$ordertype----");
        print("%%%%%%%---the order note is----$ordernote----");
        print("%%%%%%%---the adress details is----${addressDetails!.text}----");
        print("%%%%%%%---the lat is----$lat----");
        print("%%%%%%%---the lng type is----$lang----");
        statusRequest = StatusRequest.loading;
        update();
        Map data = {
          'order_userid': myServices.sharedPreferences.getString('user_id'),
          'order_type': ordertype,
          'order_note': ordernote,
          'address_lat': lat.toString(),
          'address_lng': lang.toString(),
          'address_details': addressDetails!.text
        };
        var response = await orderData.addOrder(data);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            print("----***** success add order ******------");
            Get.rawSnackbar(
                title: "تم",
                messageText: const Text(
                  "تم اضافة الطلبية بنجاح",
                  style: TextStyle(color: Colors.white),
                ));
            Get.offAllNamed(AppRoute.homeScreen);
          } else {
            print("0000000000000000000000000000000000000");
            statusRequest = StatusRequest.none;
            Get.rawSnackbar(
                title: "خطأ",
                messageText: const Text(
                  "الرجاء المحاولة مرة اخرى",
                  style: TextStyle(color: Colors.white),
                ));
          }
        } else {
          print(".................iam not inside success.........");
        }
        update();
      }
    }
  }

//-----------------order data from card------------
  late String ordertype;
  late String ordernote;
}
