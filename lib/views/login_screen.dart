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
  static const String routeName = '/';

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: ColorsManager.primaryColor,
                    size: SizeManager.sizeXL * 10,
                  ),
                ),
                const Txt(
                  text: "AAGPL LOGIN",
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
                        controller: authController.usernameController,
                        labelText: "Username",
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        prefixIconData: Icons.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a username";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: SizeManager.sizeM * 1.5,
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
                          onFieldSubmit: (_) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ErrorManager.kPasswordNullError;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: SizeManager.sizeM * 2,
                      ),
                      Obx(
                        () => CustomButton(
                          color: ColorsManager.primaryColor,
                          hasInfiniteWidth: true,
                          buttonType: ButtonType.loading,
                          loadingWidget: authController.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    backgroundColor:
                                        ColorsManager.scaffoldBgColor,
                                  ),
                                )
                              : null,
                          onPressed: () {
                            authController.login(
                              authController.usernameController.text.trim(),
                              authController.passwordController.text.trim(),
                            );
                          },
                          text: StringsManager.loginTxt,
                          textColor: ColorsManager.whiteColor,
                        ),
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
