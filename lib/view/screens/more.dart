import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/more_controller.dart';
import '../../core/constant/app_color.dart';
import '../../core/constant/image_url.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    MoreControllerIM controller = Get.put(MoreControllerIM());
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: Get.width / 3,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width / 4.5,
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 40,
                backgroundImage: const AssetImage(ImageUrl.callcenter),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Card(
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        "Dash Board",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.dashboard_customize_rounded,
                        color: Colors.green,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        controller.conectUs();
                      },
                      trailing: const Icon(
                        Icons.phone_callback,
                        color: Colors.green,
                      ),
                      title: const Text(
                        "Conenct to",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        controller.logOut();
                      },
                      trailing: const Icon(
                        Icons.logout,
                        color: Colors.green,
                      ),
                      title: const Text(
                        "Logout",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
