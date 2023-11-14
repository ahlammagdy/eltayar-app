import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/card_controller.dart';
import '../../core/constant/app_color.dart';
import '../widget/card/card_item.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CardControllerIM());
    return Container(
      color: Colors.white,
      child: GetBuilder<CardControllerIM>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppColor.primaryColor,
                    title: const Row(
                      children: [
                        Text(
                          "Card",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.shopping_cart,
                        )
                      ],
                    ),
                    actions: [
                      DropdownButton<String>(
                        value: controller.dropdownordertype,
                        icon: const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                        elevation: 20,
                        dropdownColor: AppColor.primaryColor,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (val) {
                          controller.setDropValue(val);
                        },
                        items: <String>['choose type', 'Free', 'Archive', 'Tag']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  body: Stack(alignment: Alignment.center, children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: controller.formKey,
                        child: ListView(children: [
                          ...List.generate(
                            controller.data.length,
                            (index) => CardItem(
                              itemName: '${controller.data[index].itemName}',
                              onPressedAdd: () async {
                                await controller.add(
                                    controller.data[index].itemId.toString());
                                controller.refreshPage();
                              },
                              onPressedRemove: () async {
                                await controller.delete(
                                    controller.data[index].itemId.toString());
                                controller.refreshPage();
                              },
                              count: '${controller.data[index].countitems}',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              maxLines: null,
                              controller: controller.itemNote,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'add note as you want ...',
                              ),
                              validator: (val) {
                                return controller.validItemNote(val);
                              },
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
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
                            controller
                                .gotoAddress(controller.dropdownordertype);
                          },
                          child: const Text("Continue")),
                    ),
                  ])))),
    );
  }
}
