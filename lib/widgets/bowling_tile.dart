import 'package:flutter/material.dart';

import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'custom/custom_text.dart';

class BowlingTile extends StatelessWidget {
  const BowlingTile({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.blockSizeVertical! * 5,
      child: ListTile(
        title: InkWell(
          onTap: () => controller.nextBowler(),
          child: Txt(
            text: controller.scoreboard.value.currentBowler.name,
            fontSize: SizeConfig.blockSizeVertical! * 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => controller.directlyDecBowlerConceededRuns(),
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 2,
                width: SizeConfig.blockSizeVertical! * 2,
              ),
            ),
            InkWell(
              onTap: () => controller.directlyIncBowlerConceededRuns(),
              child: Txt(
                text:
                    "${controller.scoreboard.value.currentBowler.runsConceded}-",
                fontSize: SizeConfig.blockSizeVertical! * 2.5,
                fontWeight: FontWeight.normal,
              ),
            ),
            InkWell(
              onTap: () => controller.directlyIncBowlerWickets(),
              child: Txt(
                text:
                    "${controller.scoreboard.value.currentBowler.wicketsTaken} ",
                fontSize: SizeConfig.blockSizeVertical! * 2.5,
                fontWeight: FontWeight.normal,
              ),
            ),
            InkWell(
              onTap: () => controller.directlyIncBowlerOverBalls(),
              child: Txt(
                text: "(${controller.scoreboard.value.currentBowler.overs}",
                fontSize: SizeConfig.blockSizeVertical! * 2.5,
                fontWeight: FontWeight.normal,
              ),
            ),
            InkWell(
              onTap: () => controller.directlyDecBowlerOverBalls(),
              child: Txt(
                text: ".${controller.scoreboard.value.currentBowler.balls})",
                fontSize: SizeConfig.blockSizeVertical! * 2.5,
                fontWeight: FontWeight.normal,
              ),
            ),
            InkWell(
              onTap: () => controller.directlyDecBowlerWickets(),
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 2,
                width: SizeConfig.blockSizeVertical! * 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
