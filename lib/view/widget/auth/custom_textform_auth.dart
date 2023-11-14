import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      this.icon,
      required this.textFormController,
      required this.validator,
      required this.keyboardType,
      this.obscureText,
      this.preicon,
      this.onTapIcon});

  final String hintText;
  final IconData? icon;
  final IconData? preicon;
  final TextEditingController textFormController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyboardType,
        validator: validator,
        controller: textFormController,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
          )),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            preicon,
            color: Colors.black,
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ));
  }
}
