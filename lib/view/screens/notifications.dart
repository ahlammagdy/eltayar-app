import 'package:eltayar/core/constant/app_color.dart';
import 'package:eltayar/core/constant/image_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../controller/notifications_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("Notifications"),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: GetBuilder<NotificationsController>(
          builder: (controller) => Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    ...List.generate(
                        controller.data.length,
                        (index) => Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  foregroundImage: AssetImage(ImageUrl.devon),
                                ),
                                title: Text(
                                    controller.data[index]['notify_title']),
                                subtitle:
                                    Text(controller.data[index]['notify_body']),
                                trailing: Text(
                                    Jiffy.parse(controller.data[index]
                                            ['notify_date'])
                                        .fromNow(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                              ),
                            ))
                  ],
                ),
              )),
    );
  }
}
