import 'package:eltayar/controller/test_controller.dart';
import 'package:eltayar/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("test view"),
        ),
        body: GetBuilder<TestController>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Text("${controller.data}");
                  }));
        }));
  }
}
