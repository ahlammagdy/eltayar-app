import 'package:eltayar/controller/onbording_controller.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/view/widget/onbording/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/onbording/dont_controller.dart';
import '../widget/onbording/page_view_onbording.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerim());
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 3, child: PageViewOnbording()),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                  ),
                  color: AppColor.primaryColor,
                ),
                child: const Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  DotController(),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButtonOnBording()
                ]),
              ))
        ],
      ),
    );
  }
}
