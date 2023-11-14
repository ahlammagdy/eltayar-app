import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 155, 54),
          borderRadius: BorderRadius.circular(15)),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 115,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
