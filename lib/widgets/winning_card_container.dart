import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'custom/custom_text.dart';

class WinningCardContainer extends StatelessWidget {
  const WinningCardContainer({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockVertical! * 10,
      width: SizeConfig.safeBlockHorizontal! * 45,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ColorsManager.primaryColor,
            ColorsManager.lightPrimaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Txt(
            textAlign: TextAlign.center,
            text: "Congratulations!",
            fontSize: SizeConfig.safeBlockVertical! * 3,
            color: ColorsManager.whiteColor,
            fontWeight: FontWeight.bold,
          ),
          Txt(
            textAlign: TextAlign.center,
            text:
                "${controller.winningTeam.value} has won the match against ${controller.winningTeam.value == controller.scoreboard.value.battingTeam ? controller.scoreboard.value.bowlingTeam : controller.scoreboard.value.battingTeam}.",
            fontSize: SizeConfig.safeBlockVertical! * 3,
            color: ColorsManager.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
