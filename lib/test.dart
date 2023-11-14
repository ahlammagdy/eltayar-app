import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/core/functions/check_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // ignore: prefer_typing_uninitialized_variables
  var res;

  intiadata() async {
    res = await checkInternet();
  }

  @override
  void initState() {
    intiadata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            OtpTextField(
              filled: true,
              fillColor: Colors.white,
              numberOfFields: 5,
              borderColor: AppColor.primaryColor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {},
            ),
          ],
        ),
      ),
    );
  }
}
