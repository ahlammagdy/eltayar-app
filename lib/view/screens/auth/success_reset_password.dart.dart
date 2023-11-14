import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/success_resetpass_controller.dart';
import '../../../core/constant/app_color.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPassControllerIM controller =
        Get.put(SuccessResetPassControllerIM());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Success",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.check_circle_outline,
                size: 200,
                color: Colors.white,
              ),
              Text(
                "the Password Reseted Successfully",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                //width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 115,
                  ),
                  onPressed: () {
                    controller.goToLogin();
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
