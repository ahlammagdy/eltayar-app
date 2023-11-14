import 'package:eltayar/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/constant/app_color.dart';

class ProductDetailsCountWidget extends GetView<ProductDetailsControllerIM> {
  const ProductDetailsCountWidget(
      {super.key,
      required this.addOnPressed,
      required this.nimusOnPressed,
      required this.count});
  final void Function()? addOnPressed;
  final void Function()? nimusOnPressed;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: nimusOnPressed,
            icon: const Icon(
              Icons.remove_circle,
              size: 40,
              color: Colors.green,
            )),
        Text(
          count,
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: AppColor.titleTextColor),
        ),
        IconButton(
            onPressed: addOnPressed,
            icon: const Icon(
              Icons.add_circle,
              size: 40,
              color: Colors.green,
            )),
      ],
    );
  }
}
