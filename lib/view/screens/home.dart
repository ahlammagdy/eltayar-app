import 'package:eltayar/controller/home_controller.dart';
import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_appbar.dart';
import '../widget/home/custom_category_home.dart';
import '../widget/home/custom_item_home.dart';
import '../widget/home/custom_order_type_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerIM());

    return GetBuilder<HomeControllerIM>(
        builder: (controller) => Form(
              key: controller.formKey,
              child: ListView(children: [
                CustomAppBar(
                  appBarTitle: "Search",
                  iconOnPressed: () {
                    controller.gotoNotifications();
                  },
                  searchOnPress: () {
                    controller.onsearchIcon();
                  },
                  searchController: controller.searchController!,
                  onChangedSearch: (val) {
                    controller.checkSearch(val);
                  },
                  validator: (val) {
                    return controller.validSearch(val);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch
                      ? ItemsSearch(
                          listItemsSearch: controller.listItemsSearch,
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, right: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Orders Typies",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.titleTextColor)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const CustomOrderTypeHome(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("Categories",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.titleTextColor)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const CustomCategriesHome(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Products for orders",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.titleTextColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const CustomItemHome(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                )
              ]),
            ));
  }
}

class ItemsSearch extends GetView<HomeControllerIM> {
  const ItemsSearch({super.key, required this.listItemsSearch});
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
