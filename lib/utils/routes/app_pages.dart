import 'package:aagpl_scoreboard/controllers/auth_controller.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:aagpl_scoreboard/views/admin_dashboard.dart';
import 'package:aagpl_scoreboard/views/admin_login_screen.dart';
import 'package:aagpl_scoreboard/views/scoreboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.adminLogin:
        return GetPageRoute(
          page: () => AdminLoginScreen(),
          bindings: [
            AuthBinding(),
            ScoreboardBinding(),
          ],
        );
      case AppRoutes.adminDashboard:
        return GetPageRoute(
          page: () => AdminDashboard(),
          binding: ScoreboardBinding(),
        );
      case AppRoutes.scoreboard:
        return GetPageRoute(
          page: () => ScoreboardScreen(),
          binding: ScoreboardBinding(),
        );
    }
    return null;
  }
}

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}

class ScoreboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScoreController(), fenix: true);
  }
}
