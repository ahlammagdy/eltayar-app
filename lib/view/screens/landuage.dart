import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/core/constant/app_route.dart';
import 'package:eltayar/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/language/custom_lang_button.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: AppColor.primaryColor),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomLangButton(
              buttonText: "العربية",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CustomLangButton(
              buttonText: "English",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
