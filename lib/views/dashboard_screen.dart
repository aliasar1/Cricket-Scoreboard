import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';

import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:aagpl_scoreboard/widgets/custom/custom_text.dart';

import '../constants/values.dart';
import '../widgets/custom/custom_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: MarginManager.marginXL,
            horizontal: MarginManager.marginWeb,
          ),
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
              const Txt(
                text: "Welcome to AAGPL Website",
                fontSize: 46,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColor,
              ),
              const Txt(
                text: "Please select an option.",
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
                    CustomButton(
                      color: ColorsManager.secondaryColor,
                      hasInfiniteWidth: true,
                      buttonType: ButtonType.text,
                      onPressed: () {
                        html.window.open('/#/admin-login', "_blank");
                      },
                      text: "Admin Panel",
                      textColor: ColorsManager.whiteColor,
                    ),
                    const SizedBox(
                      height: SizeManager.sizeXL,
                    ),
                    CustomButton(
                      color: ColorsManager.secondaryColor,
                      hasInfiniteWidth: true,
                      buttonType: ButtonType.text,
                      onPressed: () {
                        html.window.open('/#/scoreboard', "_blank");
                      },
                      text: "Live Scoreboard",
                      textColor: ColorsManager.whiteColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
