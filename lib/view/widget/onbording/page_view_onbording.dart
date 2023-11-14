import 'package:eltayar/controller/onbording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data_source/static/static.dart';

class PageViewOnbording extends GetView<OnBordingControllerim> {
  const PageViewOnbording({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBordingList.length,
        itemBuilder: (BuildContext context, int i) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(onBordingList[i].title!,
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                Image.asset(
                  onBordingList[i].image!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(onBordingList[i].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ));
  }
}
