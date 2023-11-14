// ignore_for_file: file_names

import 'package:eltayar/controller/items_controller.dart';
import 'package:eltayar/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/translate_database.dart';

class CustumMyItemWidget extends GetView<ItemsControllerIM> {
  const CustumMyItemWidget({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Text(
            "${translateDatabase(itemsModel.itemNameAr, itemsModel.itemName)}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
