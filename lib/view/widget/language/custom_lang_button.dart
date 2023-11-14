import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class CustomLangButton extends StatelessWidget {
  const CustomLangButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.black,
        child: Text(
          buttonText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
