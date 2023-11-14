import 'package:eltayar/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/reset_password_controller.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_auth_botton.dart';
import '../../widget/auth/custom_textform_auth.dart';
import '../../widget/auth/custom_title_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerIM controller = Get.put(ResetPasswordControllerIM());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Form(
        key: controller.formKey,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Reset Password",
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
                        title: "New Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please Enter New Password",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      CustomTextFormAuth(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) {
                          return validInput(val!, 6, 100, "password");
                        },
                        hintText: 'Enter your password',
                        icon: Icons.email_outlined,
                        textFormController: controller.passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextFormAuth(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) {
                          return validInput(val!, 6, 100, "confirm",
                              pass: controller.passwordController.text);
                        },
                        hintText: 'Confirm your password',
                        icon: Icons.email_outlined,
                        textFormController:
                            controller.confirmPasswordController,
                        obscureText: true,
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
                  buttonText: 'Save',
                  onPressed: () {
                    controller.resetPassword();
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
