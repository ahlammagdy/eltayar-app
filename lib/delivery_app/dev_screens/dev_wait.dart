import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/core/constant/image_url.dart';
import 'package:eltayar/data/model/order_model.dart';
import 'package:eltayar/delivery_app/dev_controller.dart/dev_wait_con.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/app_route.dart';

class DevWaitingOrders extends StatelessWidget {
  const DevWaitingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DevWaitingController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: const Icon(Icons.watch_later),
          title: const Text("Waiting Orders"),
        ),
        body: GetBuilder<DevWaitingController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.devWaitingDataList.length,
                    itemBuilder: (context, index) => WaitingItem(
                          waitingOrdersModel:
                              controller.devWaitingDataList[index],
                        )))));
  }
}

class WaitingItem extends GetView<DevWaitingController> {
  const WaitingItem({super.key, required this.waitingOrdersModel});
  final OrdersModel waitingOrdersModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Call center",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColor.titleTextColor),
                          ),
                          text("Name", "${waitingOrdersModel.userName}"),
                          text("Phone", "${waitingOrdersModel.phone}"),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage: AssetImage(ImageUrl.callcenter2),
                      )
                    ],
                  ),
                  const Divider(),
                  Stack(children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.titleTextColor),
                              ),
                              Text(
                                  Jiffy.parse(waitingOrdersModel.orderDate!)
                                      .fromNow(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ],
                          ),
                          text("Date", "${waitingOrdersModel.orderDate}"),
                          text("Number", "${waitingOrdersModel.orderId}"),
                          text("Type", "${waitingOrdersModel.orderType}"),
                          text(
                              "Status",
                              controller.printOrderStatus(
                                  waitingOrdersModel.orderStatus!)),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 0,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.primaryColor),
                            elevation: MaterialStateProperty.all<double>(10.0),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoute.orderDetails, arguments: {
                              "waitingOrderModel": waitingOrdersModel
                            });
                          },
                          child: const Text("Details")),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  if (waitingOrdersModel.orderStatus == "2")
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                            elevation: MaterialStateProperty.all<double>(10.0),
                          ),
                          onPressed: () {
                            controller.getApprove(
                                waitingOrdersModel.orderId.toString(),
                                waitingOrdersModel.userId.toString());
                          },
                          child: const Text("Approve")),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget text(String primary, String secondary, {Color color = Colors.black}) {
    return Text("$primary : $secondary",
        style: TextStyle(fontSize: 15, color: color));
  }
}
