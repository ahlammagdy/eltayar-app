import 'package:eltayar/controller/items_controller.dart';
import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/data/model/items_model.dart';
import 'package:eltayar/view/widget/items/custom_cat_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_appbar.dart';
import '../widget/items/myItem_widget.dart';

class MyItemsCat extends StatelessWidget {
  const MyItemsCat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerIM());
    return Scaffold(
        body: GetBuilder<ItemsControllerIM>(
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
                      child: controller.isSearch
                          ? ItemsCatSearch(
                              listItemsSearch: controller.listItemsSearch,
                            )
                          : HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: Column(
                                children: [
                                  const CustomCategriesItems(),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "All Products",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.titleTextColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  HandlingDataView(
                                      statusRequest: controller.statusRequest,
                                      widget: GridView.builder(
                                          itemCount: controller.data.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 200,
                                                  childAspectRatio: 2 / 2.25,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 20),
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return CustumMyItemWidget(
                                              itemsModel: ItemsModel.fromJson(
                                                  controller.data[index]),
                                            );
                                          }))
                                ],
                              ))),
                ])));
  }
}

class ItemsCatSearch extends GetView<ItemsControllerIM> {
  const ItemsCatSearch({super.key, required this.listItemsSearch});
  final List<ItemsModel> listItemsSearch;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listItemsSearch.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToItemsDetails(listItemsSearch[index]);
            },
            child: Card(
                elevation: 10,
                child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Text("${listItemsSearch[index].itemName}"))),
          );
        });
  }
}
