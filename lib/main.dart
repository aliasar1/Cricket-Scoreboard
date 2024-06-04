import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/routes/app_pages.dart';
import 'utils/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: StringsManager.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.adminLogin,
      onGenerateRoute: AppPages.onGenerateRoute,
    );
  }
}
