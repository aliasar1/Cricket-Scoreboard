import 'package:universal_html/html.dart' as html;

import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:aagpl_scoreboard/constants/fonts.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:aagpl_scoreboard/widgets/custom/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/values.dart';
import '../widgets/custom/custom_rounded_button.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_text_form_field.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({super.key});

  final scoreController = Get.put(ScoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        title: const Txt(
          text: "Score Management Dashboard",
          color: ColorsManager.whiteColor,
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.logout_outlined,
            color: ColorsManager.whiteColor,
            size: 34,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: MarginManager.marginXL,
          horizontal: MarginManager.marginXL,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Txt(
                      text: "Runs",
                      color: ColorsManager.primaryColor,
                      fontSize: FontSize.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRoundButton(
                            text: "1",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "2",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "3",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "4",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "6",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRoundButton(
                            text: "0",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "W",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "WB",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "NB",
                            onPressed: () {},
                          ),
                          CustomRoundButton(
                            text: "LB",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 340,
                      margin: const EdgeInsets.symmetric(
                        horizontal: MarginManager.marginXL,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: "Display Cards",
                            color: ColorsManager.primaryColor,
                            fontSize: FontSize.titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomButton(
                            color: ColorsManager.secondaryColor,
                            hasInfiniteWidth: false,
                            onPressed: () {},
                            text: "Power Play",
                            textColor: ColorsManager.whiteColor,
                          ),
                          CustomButton(
                            color: ColorsManager.secondaryColor,
                            hasInfiniteWidth: false,
                            onPressed: () {},
                            text: "Runout",
                            textColor: ColorsManager.whiteColor,
                          ),
                          CustomButton(
                            color: ColorsManager.secondaryColor,
                            hasInfiniteWidth: false,
                            onPressed: () {},
                            text: "Wicket",
                            textColor: ColorsManager.whiteColor,
                          ),
                          CustomButton(
                            color: ColorsManager.secondaryColor,
                            hasInfiniteWidth: false,
                            onPressed: () {},
                            text: "Catch",
                            textColor: ColorsManager.whiteColor,
                          ),
                          CustomButton(
                            color: ColorsManager.secondaryColor,
                            hasInfiniteWidth: false,
                            onPressed: () {},
                            text: "Hit Wicket",
                            textColor: ColorsManager.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
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
                            onPressed: () {},
                            text: "Setup Board",
                            textColor: ColorsManager.whiteColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                SizedBox(
                  width: 360,
                  child: Column(
                    children: [
                      const Txt(
                        text: "Update Manually",
                        color: ColorsManager.primaryColor,
                        fontSize: FontSize.titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller: scoreController.currentRunsController,
                        labelText: "Score",
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        prefixIconData: Icons.ballot,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Score is required.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller:
                            scoreController.totalCurrentWicketsController,
                        labelText: "Wickets",
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        prefixIconData: Icons.sports_baseball,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Wicket is required.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        color: ColorsManager.secondaryColor,
                        hasInfiniteWidth: false,
                        onPressed: () {},
                        text: "Update",
                        textColor: ColorsManager.whiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: MarginManager.marginXL,
                horizontal: MarginManager.marginWeb * 1.3,
              ),
              child: Column(
                children: [
                  CustomButton(
                    buttonType: ButtonType.text,
                    color: ColorsManager.secondaryColor,
                    hasInfiniteWidth: true,
                    onPressed: () {
                      html.window.open('/#/scoreboard', "_blank");
                    },
                    text: "Show Scoreboard",
                    textColor: ColorsManager.whiteColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    buttonType: ButtonType.text,
                    color: ColorsManager.secondaryColor,
                    hasInfiniteWidth: true,
                    onPressed: () {},
                    text: "Clear Scoreboard",
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
