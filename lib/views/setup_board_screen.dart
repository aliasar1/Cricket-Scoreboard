import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:aagpl_scoreboard/views/scoreboard_screen.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../utils/size_config.dart';
import '../widgets/custom/custom_button.dart';
import '../widgets/custom/custom_dropdown_field.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_text_form_field.dart';

class SetupScoreboardScreen extends StatelessWidget {
  SetupScoreboardScreen({super.key});
  static const String routeName = '/SetupScoreboardScreen';

  final scoreController = Get.put(ScoreController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Form(
            key: scoreController.boardFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 2,
                  vertical: SizeConfig.blockSizeVertical! * 2,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sports_cricket,
                      size: SizeConfig.blockSizeVertical! * 20,
                      color: ColorsManager.primaryColor,
                    ),
                    const Txt(
                      text: "AAGPL SEASON 13",
                      color: ColorsManager.primaryColor,
                      fontSize: FontSize.headerFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 1,
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: "Teams Data",
                            color: ColorsManager.primaryColor,
                            fontSize: FontSize.titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          CustomDropdownFormField<int>(
                            labelText: "Batting Team",
                            prefixIconData: Icons.groups_2,
                            value: scoreController.battingTeamId.value,
                            items: scoreController.teams.map((team) {
                              return DropdownMenuItem<int>(
                                value: team['id'],
                                child: Text(team['name']),
                              );
                            }).toList(),
                            onChanged: (value) {
                              scoreController.setBattingTeam(value!);
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Batting team is required.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          CustomDropdownFormField<int>(
                            labelText: "Bowling Team",
                            prefixIconData: Icons.groups_2,
                            value: scoreController.bowlingTeamId.value,
                            items: scoreController.teams.map((team) {
                              return DropdownMenuItem<int>(
                                value: team['id'],
                                child: Text(team['name']),
                              );
                            }).toList(),
                            onChanged: (value) {
                              scoreController.setBowlingTeam(value!);
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Bowling team is required.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          CustomDropdownFormField<int>(
                            labelText: "Batsman 1",
                            prefixIconData: Icons.sports_cricket,
                            value: scoreController.batsman1Id.value,
                            items: scoreController.battingTeamPlayers
                                .map((player) {
                              return DropdownMenuItem<int>(
                                value: player['id'],
                                child: Text(player['name']),
                              );
                            }).toList(),
                            onChanged: (value) {
                              scoreController.setBatsman1(value!);
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Batsman 1 is required.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          CustomDropdownFormField<int>(
                            labelText: "Batsman 2",
                            prefixIconData: Icons.sports_cricket,
                            value: scoreController.batsman2Id.value,
                            items: scoreController.battingTeamPlayers
                                .map((player) {
                              return DropdownMenuItem<int>(
                                value: player['id'],
                                child: Text(player['name']),
                              );
                            }).toList(),
                            onChanged: (value) {
                              scoreController.setBatsman2(value!);
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Batsman 2 is required.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          CustomDropdownFormField<int>(
                            labelText: "Bowler",
                            prefixIconData: Icons.sports_baseball,
                            value: scoreController.bowlerId.value,
                            items: scoreController.bowlingTeamPlayers
                                .map((player) {
                              return DropdownMenuItem<int>(
                                value: player['id'],
                                child: Text(player['name']),
                              );
                            }).toList(),
                            onChanged: (value) {
                              scoreController.setBowler(value!);
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Bowler is required.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
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
                                return "Total overs are required.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          CustomButton(
                            color: ColorsManager.primaryColor,
                            hasInfiniteWidth: true,
                            onPressed: () {
                              if (scoreController.boardFormKey.currentState!
                                  .validate()) {
                                scoreController.setupBoard();
                                Get.offAll(ScoreboardScreen());
                              }
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
            ),
          ),
        ),
      ),
    );
  }
}
