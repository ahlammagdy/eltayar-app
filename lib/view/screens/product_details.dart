import 'package:eltayar/controller/product_details_controller.dart';
import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/product_details/product_details_count_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerIM controller =
        Get.put(ProductDetailsControllerIM());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: MaterialButton(
            onPressed: () {
              controller.goToCard();
            },
            child: const Text(
              "go to Card",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerIM>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 200,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        child: Container(
                          height: 150,
                          width: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "${controller.itemsModel.itemName}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ))),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: ProductDetailsCountWidget(
                      addOnPressed: () {
                        controller.addcount();
                      },
                      nimusOnPressed: () {
                        controller.removecount();
                      },
                      count: "${controller.count}",
                    )),
              ]))),
    );
  }
}
