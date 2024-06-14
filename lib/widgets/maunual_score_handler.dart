import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import '../views/setup_board_screen.dart';
import 'custom/custom_rounded_button.dart';
import 'custom/custom_squared_button.dart';

class ManualScoreHandlerContainer extends StatelessWidget {
  const ManualScoreHandlerContainer({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 6,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorsManager.lightPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(80),
        ),
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomRoundButton(
              text: "1",
              onPressed: () {
                controller.addRuns(1, "1");
              },
            ),
            CustomRoundButton(
              text: "2",
              onPressed: () {
                controller.addRuns(2, "2");
              },
            ),
            CustomRoundButton(
              text: "3",
              onPressed: () {
                controller.addRuns(3, "3");
              },
            ),
            CustomRoundButton(
              text: "4",
              onPressed: () {
                controller.addRuns(4, "4");
                controller.onFourPressed();
              },
            ),
            CustomRoundButton(
              text: "6",
              onPressed: () {
                controller.addRuns(6, "6");
                controller.onSixPressed();
              },
            ),
            CustomRoundButton(
              text: "0",
              onPressed: () {
                controller.addRuns(0, "0");
              },
            ),
            CustomRoundButton(
              text: "W",
              onPressed: () {
                controller.addWicket();
                controller.onWicketPressed();
              },
            ),
            CustomRoundButton(
              text: "WB",
              onPressed: () {
                controller.incScoreBy1OnlyNoBallInc('WB');
                controller.onWideBallPressed();
              },
            ),
            CustomRoundButton(
              text: "NB",
              onPressed: () {
                controller.incScoreBy1OnlyNoBallInc("NB");
                controller.onNoBallPressed();
              },
            ),
            CustomRoundButton(
              text: "LB",
              onPressed: () {
                controller.addWicket();
                controller.onLBWPressed();
              },
            ),
            CustomRoundButton(
              text: "C",
              onPressed: () {
                controller.addWicket();
                controller.onCatchPressed();
              },
            ),
            CustomRoundButton(
              text: "HW",
              onPressed: () {
                controller.addWicket();
                controller.onHWPressed();
              },
            ),
            CustomRoundButton(
              text: "RO",
              onPressed: () {
                controller.addWicket();
                controller.onROPressed();
              },
            ),
            CustomRoundButton(
              text: "+1",
              onPressed: () {
                controller.addOneRun();
              },
            ),
            CustomRoundButton(
              text: "2D",
              onPressed: () {
                controller.add2DRuns();
              },
            ),
            Container(
              color: Colors.white,
              height: 50,
              width: 4,
            ),
            CustomSquareButton(
                text: "PP",
                onPressed: () {
                  controller.onPPPressed();
                }),
            InkWell(
              onTap: () {
                controller.clearBoard();
                Get.offAll(SetupScoreboardScreen());
              },
              child: Container(
                height: SizeConfig.blockSizeVertical! * 4.5,
                width: SizeConfig.blockSizeVertical! * 4.5,
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: ColorsManager.primaryColor,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.refresh,
                    color: ColorsManager.primaryColor,
                    size: SizeConfig.blockSizeVertical! * 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
