import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/orders/order_details_controller.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text("Order Details"),
          actions: const [
            Icon(Icons.shopping_cart),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: ListView(
                  children: [
                    Card(
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "Item",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "quantity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ]),
                          ...List.generate(
                            controller.data.length,
                            (index) => TableRow(children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "${controller.data[index].itemName}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "${controller.data[index].countitems}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text(
                              "order notes",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor),
                            ),
                            Text(
                              "${controller.waitingOrdersModel.orderNote}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text(
                              "Aaddress details",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor),
                            ),
                            Text(
                              "${controller.waitingOrdersModel.addressDetails}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.marker.toSet(),
                          initialCameraPosition: controller.cameraPosition!,
                          onMapCreated: (GoogleMapController mcontroller) {
                            controller.mapController.complete(mcontroller);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
