import 'package:aagpl_scoreboard/views/admin_dashboard.dart';
import 'package:aagpl_scoreboard/views/admin_login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isObscure = true.obs;
  final loginFormKey = GlobalKey<FormState>();

  void toggleVisibility() {
    isObscure.value = !isObscure.value;
  }

  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  void login(String userName, String password) {
    if (loginFormKey.currentState!.validate()) {
      if (userName == "ysb-aagpl" && password == "aagplYSB@") {
        Get.offAll(AdminDashboard());
      } else {
        Get.snackbar("Login Failed.", "Username or password is incorrect.");
      }
    }
  }

  void logout() {
    Get.offAll(AdminLoginScreen());
  }
}
