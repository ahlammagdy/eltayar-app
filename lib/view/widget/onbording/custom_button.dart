import 'package:eltayar/controller/onbording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';

class CustomButtonOnBording extends GetView<OnBordingControllerim> {
  const CustomButtonOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 2),
        onPressed: () {
          controller.next();
        },
        child: const Text(
          "Continue",
          style: TextStyle(
              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
