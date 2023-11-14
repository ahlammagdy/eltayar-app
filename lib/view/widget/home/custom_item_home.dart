import 'package:eltayar/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/translate_database.dart';
import '../../../data/model/items_model.dart';

class CustomItemHome extends GetView<HomeControllerIM> {
  const CustomItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, //200,
      child: ListView.separated(
          separatorBuilder: (context, i) => const SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[i]),
            );
          }),
    );
  }
}

class Items extends GetView<HomeControllerIM> {
  const Items({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Container(
        height: 100, //100,
        width: 110, //150,
        decoration: BoxDecoration(
            //color: Colors.black,
            borderRadius: BorderRadius.circular(20)),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3),
            child: Text(
              "${translateDatabase(itemsModel.itemNameAr, itemsModel.itemName)}",
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
