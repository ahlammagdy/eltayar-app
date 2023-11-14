import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/core/constant/image_url.dart';
import 'package:eltayar/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archieve_order_controller.dart';
import '../../../core/constant/app_route.dart';

class ArchivedOrders extends StatelessWidget {
  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchievedgOrderController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: const Icon(Icons.list_alt_rounded),
          title: const Text("Done Orders"),
        ),
        body: GetBuilder<ArchievedgOrderController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.archievedOrderDataList.length,
                    itemBuilder: (context, index) => ArchieveItem(
                          archieveOrdersModel:
                              controller.archievedOrderDataList[index],
                        )))));
  }
}

class ArchieveItem extends GetView<ArchievedgOrderController> {
  const ArchieveItem({super.key, required this.archieveOrdersModel});
  final OrdersModel archieveOrdersModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                      text("Name", "${archieveOrdersModel.userName}"),
                      text("Phone", "${archieveOrdersModel.phone}"),
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
                              Jiffy.parse(archieveOrdersModel.orderDate!)
                                  .fromNow(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
                      text("Date", "${archieveOrdersModel.orderDate}"),
                      text("Number", "${archieveOrdersModel.orderId}"),
                      text("Type", "${archieveOrdersModel.orderType}"),
                      text(
                          "Status",
                          controller.printOrderStatus(
                              archieveOrdersModel.orderStatus!)),
                      // text("Note", "${waitingOrdersModel.orderNote}"),
                      // text("Address", "${waitingOrdersModel.addressDetails}"),
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
                          "waitingOrderModel": archieveOrdersModel
                        });
                      },
                      child: const Text("Details")),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget text(String primary, String secondary, {Color color = Colors.black}) {
    return Text("$primary : $secondary",
        style: TextStyle(fontSize: 15, color: color));
  }
}
