import 'package:eltayar/core/constant/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtomAppbar extends StatelessWidget {
  CustomButtomAppbar(
      {super.key,
      this.onPressed,
      required this.name,
      required this.icon,
      required this.active});
  final void Function()? onPressed;
  final String name;
  final IconData icon;
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? AppColor.primaryColor : Colors.black,
          ),
          Text(
            name,
            style:
                TextStyle(color: active ? AppColor.primaryColor : Colors.black),
          )
        ],
      ),
    );
  }
}
