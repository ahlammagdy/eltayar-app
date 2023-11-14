import 'package:eltayar/controller/onbording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data_source/static/static.dart';

class DotController extends StatefulWidget {
  const DotController({super.key});

  @override
  State<DotController> createState() => _DotControllerState();
}

class _DotControllerState extends State<DotController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerim>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBordingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          height: 6,
                          width: controller.currentPage == index ? 15 : 6,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
