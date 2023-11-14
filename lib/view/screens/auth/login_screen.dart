import 'package:eltayar/core/constant/image_url.dart';
import 'package:eltayar/core/functions/alrt_exit_app.dart';
import 'package:eltayar/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/status_request.dart';
import '../../widget/auth/custom_auth_botton.dart';
import '../../widget/auth/custom_textform_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LogingControllerIM());

    return SafeArea(
      child: Center(
        child: Scaffold(
            body: WillPopScope(
                onWillPop: alertExitApp,
                child: GetBuilder<LogingControllerIM>(
                    builder: (controller) => controller.statusRequest ==
                            StatusRequest.loading
                        ? Center(child: Lottie.asset(ImageUrl.loading))
                        : SingleChildScrollView(
                            child: Column(children: [
                              Form(
                                key: controller.formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                            ImageUrl.dev,
                                          ),
                                          CustomTextFormAuth(
                                            keyboardType: TextInputType.phone,
                                            validator: (val) {
                                              return validInput(
                                                  val!, 11, 100, "phone");
                                            },
                                            hintText: 'Phone',
                                            preicon: Icons.phone,
                                            textFormController:
                                                controller.phoneController,
                                            obscureText: false,
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          CustomTextFormAuth(
                                            obscureText: controller.isShowPass,
                                            onTapIcon: () {
                                              controller.showPassword();
                                            },
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            validator: (val) {
                                              return validInput(
                                                  val!, 6, 100, "password");
                                            },
                                            hintText: "Password",
                                            preicon: Icons.lock,
                                            icon: Icons.remove_red_eye_outlined,
                                            textFormController:
                                                controller.passwordController,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CustomAuthButton(
                                        buttonText: 'Login',
                                        onPressed: () {
                                          controller.login();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          )))),
      ),
    );
  }
}
