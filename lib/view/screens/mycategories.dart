import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/categories_controller.dart';
import '../widget/categories/custom_cat_type.dart';
import '../widget/categories/custom_order_incat.dart';
import '../widget/custom_appbar.dart';

class MyCategories extends StatelessWidget {
  const MyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesControllerIM());
    return Scaffold(
        body: GetBuilder<CategoriesControllerIM>(
            builder: (controller) => ListView(children: [
                  CustomAppBar(
                    appBarTitle: "Search",
                    iconOnPressed: () {},
                    searchOnPress: () {
                      controller.onsearchIcon();
                    },
                    searchController: controller.searchController!,
                    onChangedSearch: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const CustomOrderTypeCAT(),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "All categories",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.titleTextColor),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.isSearch
                              ? ItemsCatSearch(
                                  listCatSearch: controller.listCatSearch,
                                )
                              : HandlingDataView(
                                  statusRequest: controller.statusRequest,
                                  widget: const CustumMyCategoryWidget())
                        ],
                      )),
                ])));
  }
}

class ItemsCatSearch extends GetView<CategoriesControllerIM> {
  const ItemsCatSearch({super.key, required this.listCatSearch});
  final List<CategoriesModel> listCatSearch;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listCatSearch.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToItems(controller.categories, index,
                  controller.listCatSearch[index].categoryId.toString());
            },
            child: Card(
                elevation: 10,
                child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Text("${listCatSearch[index].categoryName}"))),
          );
        });
  }
}
