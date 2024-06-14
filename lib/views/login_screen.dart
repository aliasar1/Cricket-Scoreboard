import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../constants/values.dart';
import '../controllers/auth_controller.dart';
import '../utils/size_config.dart';
import '../widgets/custom/custom_button.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_text_form_field.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginScreen({super.key});
  static const String routeName = '/';

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight! * 0.2,
            horizontal: SizeConfig.screenWidth! * 0.1,
          ),
          child: Form(
            key: authController.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: SizeConfig.screenHeight! * 0.3,
                    width: SizeConfig.screenHeight! * 0.3,
                    child: Image.asset(
                      'assets/logos/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenWidth! * 0.01,
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
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth! * 0.3,
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
                        height: SizeManager.sizeM,
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
                        height: SizeManager.sizeM * 1.5,
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
