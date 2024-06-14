import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'custom/custom_tile.dart';

class PlayingBatsmanTiles extends StatelessWidget {
  const PlayingBatsmanTiles({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.safeBlockHorizontal! * 30,
      child: Obx(
        () => Column(
          children: [
            CustomListTile(
              onTogglerPressed: () => controller.rotateStrike(),
              onBatsmanPressed: () => controller.nextBatsman1(),
              isOnStrike: controller.scoreboard.value.batsman1.isOnStrike,
              name: controller.scoreboard.value.batsman1.name,
              runs: controller.scoreboard.value.batsman1.runs,
              ballFaced: controller.scoreboard.value.batsman1.ballsFaced,
              onDecBallsPressed: () => controller.directlyDecBallsFaced(true),
              onDecRunsPressed: () => controller.directlyDecRunsBatsman(true),
              onIncBallsPressed: () => controller.directlyIncBallsFaced(true),
              onIncRunsPressed: () => controller.directlyIncRunsBatsman(true),
            ),
            CustomListTile(
              onTogglerPressed: () => controller.rotateStrike(),
              onBatsmanPressed: () => controller.nextBatsman2(),
              isOnStrike: controller.scoreboard.value.batsman2.isOnStrike,
              name: controller.scoreboard.value.batsman2.name,
              runs: controller.scoreboard.value.batsman2.runs,
              ballFaced: controller.scoreboard.value.batsman2.ballsFaced,
              onDecBallsPressed: () => controller.directlyDecBallsFaced(false),
              onDecRunsPressed: () => controller.directlyDecRunsBatsman(false),
              onIncBallsPressed: () => controller.directlyIncBallsFaced(false),
              onIncRunsPressed: () => controller.directlyIncRunsBatsman(false),
            ),
          ],
        ),
      ),
    );
  }
}
