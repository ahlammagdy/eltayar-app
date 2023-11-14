import 'package:eltayar/binding.dart';
import 'package:eltayar/core/localization/translation.dart';
import 'package:eltayar/core/services/get_services.dart';
import 'package:eltayar/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/change_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      initialBinding: InitialBinding(),
      theme: ThemeData(
          canvasColor: Colors.grey[100],
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(height: 2, fontSize: 15, color: Colors.black),
          )),
      getPages: routes,
    );
  }
}
