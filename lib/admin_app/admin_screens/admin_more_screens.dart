import 'package:eltayar/admin_app/admin_controller/admin_more_con.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_color.dart';
import '../../core/constant/image_url.dart';

class AdminMorePage extends StatelessWidget {
  const AdminMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    AdminMoreControllerIM controller = Get.put(AdminMoreControllerIM());
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: Get.width / 3,
              color: AppColor.primaryColor,
              child: const Text(
                "More Options",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
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
                      onTap: () {
                        controller.addNewUser();
                      },
                      trailing: const Icon(
                        Icons.person_add_alt_1,
                        color: Colors.green,
                      ),
                      title: const Text(
                        "Add New User",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(),
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
                        controller.goToReports();
                      },
                      title: const Text(
                        "Reports",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.menu_book_outlined,
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
                        "Conenct to call center",
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
