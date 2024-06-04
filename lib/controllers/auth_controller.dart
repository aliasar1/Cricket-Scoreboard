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
}
