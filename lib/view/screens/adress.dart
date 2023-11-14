// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

import '../../controller/adress_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../core/constant/app_color.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "order location",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: GetBuilder<AddressController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GooglePlaceAutoCompleteTextField(
                    textEditingController: controller.searchController!,
                    googleAPIKey: "AIzaSyDQqYtE4CPjA30M13Vq9c3kJzP1njZ5Mmg",
                    inputDecoration: const InputDecoration(
                      hintText: "Search for location",
                      hintStyle: TextStyle(color: AppColor.primaryColor),
                    ),
                    debounceTime: 400,
                    countries: const ["eg"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      print(
                          "placeDetails--------##---------------${prediction.lat}");
                      print(
                          "placeDetails--------##---------------${prediction.lng}");
                    },
                    itemClick: (Prediction prediction) async {
                      controller.searchController!.text =
                          prediction.description ?? "";
                      controller.searchController!.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: prediction.description?.length ?? 0));

                      final LatLng? latLng = await controller
                          .getLatLngFromPlaceId(prediction.placeId!);
                      if (latLng != null) {
                        controller.moveCameraToLocation(latLng);
                        controller.addMarkers(latLng);
                      }
                    },
                    seperatedBuilder: const Divider(),
                    itemBuilder: (context, index, Prediction prediction) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(child: Text(prediction.description ?? ""))
                          ],
                        ),
                      );
                    },
                    isCrossBtnShown: true,
                  ),
                ),
                if (controller.kGooglePlex != null)
                  Expanded(
                    child: Stack(alignment: Alignment.center, children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controller.marker.toSet(),
                        onTap: (latLng) {
                          controller.addMarkers(latLng);
                        },
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController mcontroller) {
                          controller.mapController.complete(mcontroller);
                        },
                      ),
                      Positioned(
                        bottom: 20,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.primaryColor),
                              elevation:
                                  MaterialStateProperty.all<double>(10.0),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              controller.sendOrder();
                            },
                            child: const Text("Continue")),
                      ),
                    ]),
                  ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    maxLines: null,
                    controller: controller.addressDetails,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'write address details ...',
                    ),
                    validator: (val) {
                      return controller.validAddressDetails(val);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
