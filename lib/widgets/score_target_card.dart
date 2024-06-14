import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'custom/custom_text.dart';

class ScoreTargetCards extends StatelessWidget {
  const ScoreTargetCards({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: controller.isTargetSet.value
                ? Alignment.centerLeft
                : Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockVertical! * 10,
              ),
              height: SizeConfig.safeBlockVertical! * 25,
              width: SizeConfig.safeBlockHorizontal! * 25,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    ColorsManager.whiteColor,
                    Color.fromARGB(255, 214, 213, 213),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Txt(
                    textAlign: TextAlign.center,
                    text: "SCORE",
                    fontSize: SizeConfig.blockSizeVertical! * 5,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Txt(
                        textAlign: TextAlign.center,
                        text: " ${controller.scoreboard.value.totalRuns}/ ",
                        fontSize: SizeConfig.blockSizeVertical! * 6,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.primaryColor,
                      ),
                      Txt(
                        textAlign: TextAlign.center,
                        text: "${controller.scoreboard.value.wickets} ",
                        fontSize: SizeConfig.blockSizeVertical! * 6,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.primaryColor,
                      ),
                    ],
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal! * 20,
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockVertical! * 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          ColorsManager.primaryColor,
                          ColorsManager.lightPrimaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Txt(
                          text: "Over: ",
                          fontSize: SizeConfig.blockSizeVertical! * 5,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.whiteColor,
                        ),
                        Txt(
                          text:
                              "${controller.currentOver.value}.${controller.currentBall.value}",
                          fontSize: SizeConfig.blockSizeVertical! * 5,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() =>
              controller.isTargetSet.value || controller.isWinningCardUp.value
                  ? Container(
                      height: SizeConfig.safeBlockVertical! * 25,
                      width: SizeConfig.safeBlockHorizontal! * 25,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            ColorsManager.whiteColor,
                            Color.fromARGB(255, 214, 213, 213),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.directlyDecTarget();
                            },
                            child: Txt(
                              textAlign: TextAlign.center,
                              text: "Target ",
                              fontSize: SizeConfig.safeBlockVertical! * 7,
                              color: ColorsManager.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.directlyIncTarget();
                            },
                            child: Txt(
                              textAlign: TextAlign.center,
                              text:
                                  ' ${controller.scoreboard.value.target.toString()}',
                              fontSize: SizeConfig.safeBlockVertical! * 7,
                              color: ColorsManager.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()),
        ],
      ),
    );
  }
}
