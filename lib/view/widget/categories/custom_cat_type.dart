// ignore_for_file: file_names

import 'package:eltayar/controller/categories_controller.dart';
import 'package:eltayar/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/translate_database.dart';

class CustumMyCategoryWidget extends GetView<CategoriesControllerIM> {
  const CustumMyCategoryWidget({super.key});
  // final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.categories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (BuildContext context, index) {
          return CatType(
              selectedCat: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        });
  }
}

class CatType extends GetView<CategoriesControllerIM> {
  const CatType(
      {required this.selectedCat, required this.categoriesModel, super.key});
  final CategoriesModel categoriesModel;
  final int selectedCat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, selectedCat,
            categoriesModel.categoryId.toString());
      },
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(3),
            child: Text(
              "${translateDatabase(categoriesModel.categoryNameAr, categoriesModel.categoryName)}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
