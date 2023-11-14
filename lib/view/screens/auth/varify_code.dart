import 'package:eltayar/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/varify_code_controller.dart';
import '../../widget/auth/custom_title_auth.dart';

class VarifyCode extends StatelessWidget {
  const VarifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VarifyCodeControllerIM controller = Get.put(VarifyCodeControllerIM());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Code Varification",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                      bottomRight: Radius.circular(60.0),
                      bottomLeft: Radius.circular(60.0),
                    ),
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomTitleAuth(
                        title: "Check Code",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "please in the code sent to ahlammagdy333@gmail.com ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      OtpTextField(
                        filled: true,
                        fillColor: Colors.white,
                        numberOfFields: 5,
                        borderColor: AppColor.primaryColor,
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          controller.goToRestPassword();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
