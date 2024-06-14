import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:flutter/material.dart';

import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'custom/custom_text.dart';

class PlayingTeamBanner extends StatelessWidget {
  const PlayingTeamBanner({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: SizeConfig.safeBlockVertical! * 7,
            width: SizeConfig.safeBlockHorizontal! * 7,
            child: Image.asset(StringsManager.batIcon)),
        Txt(
          text: "${controller.scoreboard.value.battingTeam} ",
          fontSize: SizeConfig.blockSizeVertical! * 7,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        Txt(
          text: "vs ",
          fontSize: SizeConfig.blockSizeVertical! * 6,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 202, 196, 196),
        ),
        Txt(
          text: "${controller.scoreboard.value.bowlingTeam} ",
          fontSize: SizeConfig.blockSizeVertical! * 7,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        SizedBox(
            height: SizeConfig.safeBlockVertical! * 7,
            width: SizeConfig.safeBlockHorizontal! * 7,
            child: Image.asset(StringsManager.ballIcon)),
      ],
    );
  }
}
