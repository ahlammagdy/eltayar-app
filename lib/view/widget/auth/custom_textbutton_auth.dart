import 'package:eltayar/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextButtonAuth extends StatelessWidget {
  const CustomTextButtonAuth({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            )));
  }
}
