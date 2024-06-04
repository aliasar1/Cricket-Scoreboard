import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../constants/values.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom/custom_button.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_text_form_field.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginScreen({super.key});
  static const String routeName = '/admin-login';

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: MarginManager.marginXL,
            horizontal: MarginManager.marginWeb,
          ),
          child: Form(
            key: authController.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Icon(
                    Icons.sports_cricket,
                    color: ColorsManager.secondaryColor,
                    size: SizeManager.sizeXL * 10,
                  ),
                ),
                const SizedBox(
                  height: SizeManager.sizeXL,
                ),
                const Txt(
                  text: "AAGPL LOGIN SCREEN",
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColor,
                ),
                const Txt(
                  text: "Please add details to login.",
                  fontSize: 26,
                  fontWeight: FontWeight.normal,
                  color: ColorsManager.primaryColor,
                ),
                const SizedBox(
                  height: SizeManager.sizeL,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: MarginManager.marginWeb,
                  ),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: authController.emailController,
                        labelText: StringsManager.emailTxt,
                        autofocus: false,
                        hintText: StringsManager.emailHintTxt,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        prefixIconData: Icons.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ErrorManager.kEmailNullError;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: SizeManager.sizeL,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          controller: authController.passwordController,
                          autofocus: false,
                          labelText: StringsManager.passwordTxt,
                          obscureText: authController.isObscure.value,
                          prefixIconData: Icons.vpn_key_rounded,
                          suffixIconData: authController.isObscure.value
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          onSuffixTap: authController.toggleVisibility,
                          textInputAction: TextInputAction.done,
                          onFieldSubmit: (_) {
                            authController.login(
                                authController.emailController.text.trim(),
                                authController.passwordController.text.trim());
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ErrorManager.kPasswordNullError;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: SizeManager.sizeXL,
                      ),
                      CustomButton(
                        color: ColorsManager.secondaryColor,
                        hasInfiniteWidth: true,
                        onPressed: () {
                          authController.login(
                              authController.emailController.text.trim(),
                              authController.passwordController.text.trim());
                        },
                        text: StringsManager.loginTxt,
                        textColor: ColorsManager.whiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
