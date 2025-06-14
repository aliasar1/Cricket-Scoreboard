import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'custom/custom_text.dart';
import 'gradient_round_container.dart';

class ScoreOverContainer extends StatelessWidget {
  const ScoreOverContainer({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: Container(
        height: SizeConfig.safeBlockVertical! * 9,
        decoration: BoxDecoration(
          color: ColorsManager.blackColor.withOpacity(0.9),
          borderRadius: const BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientRoundedContainer(
                  height: SizeConfig.safeBlockVertical! * 4.3,
                  width: SizeConfig.safeBlockHorizontal! * 10,
                  gradientColors: const [
                    ColorsManager.lightPrimaryColor,
                    ColorsManager.lightPrimaryColor
                  ],
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 3,
                      ),
                      InkWell(
                        onTap: () {
                          controller.incScoreOnly();
                        },
                        child: Txt(
                          textAlign: TextAlign.end,
                          text: " ${controller.scoreboard.value.totalRuns}/ ",
                          fontSize: SizeConfig.blockSizeVertical! * 3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.incWicketDirectly();
                        },
                        child: Txt(
                          textAlign: TextAlign.end,
                          text: "${controller.scoreboard.value.wickets} ",
                          fontSize: SizeConfig.blockSizeVertical! * 3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 1,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => controller.directlyDecOver(),
                      child: Txt(
                        text: "Over: ",
                        fontSize: SizeConfig.blockSizeVertical! * 3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.directlyIncOver(),
                      child: Txt(
                        text:
                            "${controller.currentOver.value}.${controller.currentBall.value}",
                        fontSize: SizeConfig.blockSizeVertical! * 3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: SizeConfig.safeBlockVertical! * 3,
                    width: SizeConfig.safeBlockHorizontal! * 3,
                    child: Image.asset(StringsManager.batIcon)),
                InkWell(
                  onTap: () {
                    controller.decrementScore();
                  },
                  child: Txt(
                    text: controller.scoreboard.value.battingTeam ==
                            "FUNERAL SERVICE"
                        ? "FUNERAL "
                        : "${controller.scoreboard.value.battingTeam} ",
                    fontSize: controller.scoreboard.value.battingTeam ==
                            "FUNERAL SERVICE"
                        ? SizeConfig.blockSizeVertical! * 2.2
                        : SizeConfig.blockSizeVertical! * 2.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Txt(
                  text: "vs ",
                  fontSize: SizeConfig.blockSizeVertical! * 3,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 202, 196, 196),
                ),
                InkWell(
                  onTap: () => controller.decWicketDirectly(),
                  child: Txt(
                    text: controller.scoreboard.value.bowlingTeam ==
                            "FUNERAL SERVICE"
                        ? "FUNERAL "
                        : "${controller.scoreboard.value.bowlingTeam} ",
                    fontSize: controller.scoreboard.value.bowlingTeam ==
                            "FUNERAL SERVICE"
                        ? SizeConfig.blockSizeVertical! * 2.2
                        : SizeConfig.blockSizeVertical! * 2.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                    height: SizeConfig.safeBlockVertical! * 3,
                    width: SizeConfig.safeBlockHorizontal! * 3,
                    child: Image.asset(StringsManager.ballIcon)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
