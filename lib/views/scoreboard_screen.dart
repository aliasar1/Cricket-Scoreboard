import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/size_config.dart';
import '../widgets/balls_stats_list.dart';
import '../widgets/bowling_tile.dart';
import '../widgets/curved_bottom_container.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/maunual_score_handler.dart';
import '../widgets/page_header.dart';
import '../widgets/playing_batsman_tiles.dart';
import '../widgets/playing_team_banner.dart';
import '../widgets/score_over_container.dart';
import '../widgets/score_target_card.dart';
import '../widgets/text_container.dart';
import '../widgets/winning_card_container.dart';

class ScoreboardScreen extends StatelessWidget {
  ScoreboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/ScoreboardScreen';

  // final ScoreController controller = Get.find<ScoreController>();
  final ScoreController controller = Get.put(ScoreController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(StringsManager.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(
          () => Column(
            children: [
              const PageHeader(),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 4,
              ),
              PlayingTeamBanner(controller: controller),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 4,
              ),
              ScoreTargetCards(controller: controller),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 4,
              ),
              controller.isCatchPressed.value
                  ? const TextContainer(
                      text: 'CATCH OUT',
                    )
                  : Container(),
              controller.isFourPressed.value
                  ? const TextContainer(
                      text: '4 RUNS',
                    )
                  : Container(),
              controller.isHWPressed.value
                  ? const TextContainer(
                      text: 'HIT WICKET',
                    )
                  : Container(),
              controller.isNoBallPressed.value
                  ? const TextContainer(
                      text: 'NO BALL',
                    )
                  : Container(),
              controller.isPPPressed.value
                  ? const TextContainer(
                      text: 'POWER PLAY',
                    )
                  : Container(),
              controller.isWideBallPressed.value
                  ? const TextContainer(
                      text: 'Wide Ball',
                    )
                  : Container(),
              controller.isLBWPressed.value
                  ? const TextContainer(
                      text: 'LBW',
                    )
                  : Container(),
              controller.isROPressed.value
                  ? const TextContainer(
                      text: 'RUN OUT',
                    )
                  : Container(),
              controller.isSixPressed.value
                  ? const TextContainer(
                      text: '6 RUNS',
                    )
                  : Container(),
              controller.isTOPressed.value
                  ? const TextContainer(
                      text: 'TIME OUT',
                    )
                  : Container(),
              controller.isWicketPressed.value
                  ? const TextContainer(
                      text: 'WICKET',
                    )
                  : Container(),
              const Spacer(),
              Column(
                children: [
                  controller.isWinningCardUp.value &&
                          controller.isAnyCardsUp.isFalse
                      ? WinningCardContainer(controller: controller)
                      : Container(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => controller.nextBattingTeam(),
                        child: Obx(
                          () => CurvedParentContainer(
                            isLeft: true,
                            height: SizeConfig.safeBlockVertical! * 10,
                            width: SizeConfig.safeBlockHorizontal! * 10,
                            gradientColors: const [
                              Colors.white,
                              Colors.white70
                            ],
                            child: SizedBox(
                              width: SizeConfig.safeBlockVertical! * 20,
                              child: Txt(
                                textAlign: TextAlign.center,
                                text: controller.scoreboard.value.battingTeam,
                                fontSize: SizeConfig.safeBlockVertical! * 3.6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: SizeConfig.safeBlockVertical! * 10,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlayingBatsmanTiles(controller: controller),
                              SizedBox(
                                  width: SizeConfig.safeBlockHorizontal! * 1),
                              ScoreOverContainer(controller: controller),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 1,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    BowlingTile(controller: controller),
                                    BallsStatsList(controller: controller),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 25),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.nextBowlingTeam(),
                        child: CurvedParentContainer(
                          isLeft: false,
                          height: SizeConfig.safeBlockVertical! * 10,
                          width: SizeConfig.safeBlockHorizontal! * 10,
                          gradientColors: const [Colors.white70, Colors.white],
                          child: Center(
                            child: SizedBox(
                              width: SizeConfig.safeBlockVertical! * 20,
                              child: Txt(
                                textAlign: TextAlign.center,
                                text: controller.scoreboard.value.bowlingTeam,
                                fontSize: SizeConfig.safeBlockVertical! * 3.6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ManualScoreHandlerContainer(controller: controller),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
