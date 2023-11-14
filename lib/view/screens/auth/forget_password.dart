import 'package:eltayar/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/forget_password_controller.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_auth_botton.dart';
import '../../widget/auth/custom_textform_auth.dart';
import '../../widget/auth/custom_title_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordIM controller = Get.put(ForgetPasswordIM());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Forget Password",
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
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomTitleAuth(
                        title: "Check Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please enter your email Address to Recive A varification code ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      CustomTextFormAuth(
                        validator: (val) {
                          return validInput(val!, 6, 100, "email");
                        },
                        hintText: 'Enter your Email',
                        icon: Icons.email_outlined,
                        textFormController: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomAuthButton(
                  buttonText: 'Check',
                  onPressed: () {
                    controller.checkEmail();
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
