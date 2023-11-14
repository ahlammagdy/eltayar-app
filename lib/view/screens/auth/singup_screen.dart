import 'package:eltayar/core/class/status_request.dart';
import 'package:eltayar/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/auth/singup_controller.dart';
import '../../../core/constant/image_url.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_auth_botton.dart';
import '../../widget/auth/custom_textform_auth.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => (SingupControllerIM()));
    return Scaffold(
        body: GetBuilder<SingupControllerIM>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? Center(child: Lottie.asset(ImageUrl.loading))
          : ListView(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            ImageUrl.dev,
                          ),
                          CustomTextFormAuth(
                            preicon: Icons.person,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return validInput(val!, 3, 100, "username");
                            },
                            hintText: 'username',
                            textFormController: controller.usernameController,
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormAuth(
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              return validInput(val!, 11, 100, "phone");
                            },
                            hintText: 'Phone',
                            preicon: Icons.phone,
                            textFormController: controller.phoneController,
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormAuth(
                            obscureText: controller.isShowPass,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              return validInput(val!, 6, 100, "password");
                            },
                            hintText: "Password",
                            preicon: Icons.lock,
                            icon: Icons.remove_red_eye_outlined,
                            textFormController: controller.passwordController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DropdownButton<String>(
                            value: controller.dropdownuserrole,
                            icon: const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: AppColor.primaryColor,
                            ),
                            iconSize: 30,
                            elevation: 20,
                            dropdownColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (val) {
                              controller.setDropValue(val);
                            },
                            items: <String>[
                              'choose role',
                              'Admin',
                              'Call Center',
                              'Tayar'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor,
                                      fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      CustomAuthButton(
                        buttonText: 'SingUp',
                        onPressed: () {
                          controller.singup(controller.dropdownuserrole);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "already have acount",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                controller.goToLogin();
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
    ));
  }
}
