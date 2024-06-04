import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:aagpl_scoreboard/views/admin_dashboard.dart';
import 'package:aagpl_scoreboard/views/admin_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/scoreboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringsManager.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: "/admin-dashboard",
      routes: {
        "/": (context) => AdminLoginScreen(),
        "/scoreboard": (context) => const ScoreboardScreen(),
        "/admin-dashboard": (context) => AdminDashboard(),
      },
    );
  }
}
