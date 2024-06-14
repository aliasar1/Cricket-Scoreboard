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
        decoration: const BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientRoundedContainer(
                  height: SizeConfig.safeBlockVertical! * 4,
                  width: SizeConfig.safeBlockHorizontal! * 8,
                  gradientColors: const [
                    ColorsManager.redColor,
                    ColorsManager.primaryColor
                  ],
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * 0.5,
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
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 1.5,
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
                    text: "${controller.scoreboard.value.battingTeam} ",
                    fontSize: SizeConfig.blockSizeVertical! * 3.2,
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
                    text: "${controller.scoreboard.value.bowlingTeam} ",
                    fontSize: SizeConfig.blockSizeVertical! * 3.2,
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
