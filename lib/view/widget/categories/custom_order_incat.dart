import 'package:eltayar/controller/categories_controller.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/data/model/order_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/translate_database.dart';

class CustomOrderTypeCAT extends GetView<CategoriesControllerIM> {
  const CustomOrderTypeCAT({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesControllerIM());
    return SizedBox(
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.ordersTypes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return OrderType(
              orderTypeModel:
                  OrderTypeModel.fromJson(controller.ordersTypes[index]),
              selectedtype: index,
            );
          }),
    );
  }
}

class OrderType extends GetView<CategoriesControllerIM> {
  final OrderTypeModel orderTypeModel;
  final int selectedtype;

  const OrderType(
      {required this.orderTypeModel, required this.selectedtype, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeType(
            selectedtype, orderTypeModel.ordertypeId.toString());
      },
      child: GetBuilder<CategoriesControllerIM>(
        builder: (controller) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(3),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              height: 100,
              width: 100,
              child: Text(
                "${translateDatabase(orderTypeModel.ordertypeNameAr, orderTypeModel.ordertypeName)}",
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 17,
                    color: controller.selectedtype == selectedtype
                        ? AppColor.primaryColor
                        : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
