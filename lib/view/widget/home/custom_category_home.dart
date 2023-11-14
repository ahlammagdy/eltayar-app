import 'package:eltayar/controller/home_controller.dart';
import 'package:eltayar/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/translate_database.dart';

class CustomCategriesHome extends GetView<HomeControllerIM> {
  const CustomCategriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // 350,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Category(
              selectedCat: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Category extends GetView<HomeControllerIM> {
  const Category(
      {super.key, required this.categoriesModel, required this.selectedCat});
  final CategoriesModel categoriesModel;
  final int selectedCat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, selectedCat,
            categoriesModel.categoryId.toString());
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70)),
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(3),
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                height: 100,
                width: 100,
                child: Text(
                  "${translateDatabase(categoriesModel.categoryNameAr, categoriesModel.categoryName)}",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
