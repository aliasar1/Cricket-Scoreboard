import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:aagpl_scoreboard/views/scoreboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../widgets/custom/custom_button.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_text_form_field.dart';

class SetupScoreboardScreen extends StatelessWidget {
  SetupScoreboardScreen({super.key});

  final scoreController = Get.put(ScoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.sports_cricket,
              size: 300,
              color: ColorsManager.secondaryColor,
            ),
            SizedBox(
              width: 360,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Txt(
                    text: "Team Data",
                    color: ColorsManager.primaryColor,
                    fontSize: FontSize.titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomTextFormField(
                    controller: scoreController.battingTeamController,
                    labelText: "Batting Team Name",
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    prefixIconData: Icons.groups_2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Batting Team Name is required.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: scoreController.bowlingTeamController,
                    labelText: "Bowling Team Name",
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    prefixIconData: Icons.groups_2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bowling team name required.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: scoreController.batsman1Controller,
                    labelText: "Batsman 1 Name",
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    prefixIconData: Icons.sports_cricket,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Batsman name is required.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: scoreController.batsman2Controller,
                    labelText: "Batsman 2 Name",
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    prefixIconData: Icons.sports_cricket,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Batsman name is required.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: scoreController.bowlerController,
                    labelText: "Bowler Name",
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    prefixIconData: Icons.sports_baseball,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bowler name is required.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: scoreController.totalOversController,
                    labelText: "Total Overs",
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    prefixIconData: Icons.ballot,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Total over is required.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: scoreController.givenTargetController,
                    labelText: "Target",
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    prefixIconData: Icons.crisis_alert,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    color: ColorsManager.secondaryColor,
                    hasInfiniteWidth: false,
                    onPressed: () {
                      scoreController.setupBoard();
                      Get.offAll(const ScoreboardScreen());
                    },
                    text: "Setup Board",
                    textColor: ColorsManager.whiteColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
