import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/size_config.dart';
import '../widgets/ball_container.dart';
import '../widgets/curved_bottom_container.dart';
import '../widgets/custom/custom_rounded_button.dart';
import '../widgets/custom/custom_squared_button.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_tile.dart';
import '../widgets/gradient_round_container.dart';
import '../widgets/image_container.dart';

class ScoreboardScreen extends StatelessWidget {
  ScoreboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/ScoreboardScreen';

  final ScoreController controller = Get.put(ScoreController());
  // final ScoreController controller = Get.find<ScoreController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 4,
              ),
              controller.isCatchPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/catch.jpg',
                    )
                  : Container(),
              controller.isFourPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/four.jpeg',
                    )
                  : Container(),
              controller.isHWPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/hitwicket.jpg',
                    )
                  : Container(),
              controller.isNoBallPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/noball.jpg',
                    )
                  : Container(),
              controller.isPPPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/pp.jpg',
                    )
                  : Container(),
              controller.isROPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/runout.jpg',
                    )
                  : Container(),
              controller.isSixPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/six.jpg',
                    )
                  : Container(),
              controller.isTOPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/to.jpg',
                    )
                  : Container(),
              controller.isWicketPressed.value
                  ? const ImageContainer(
                      imageUrl: 'assets/images/wicket.jpg',
                    )
                  : Container(),
              Obx(() => controller.isTargetSet.value &&
                      controller.isAnyCardsUp.isFalse
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Txt(
                            textAlign: TextAlign.center,
                            text: "Target",
                            fontSize: SizeConfig.safeBlockVertical! * 7,
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          Txt(
                            textAlign: TextAlign.center,
                            text: controller.scoreboard.value.target.toString(),
                            fontSize: SizeConfig.safeBlockVertical! * 10,
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    )
                  : Container()),
              controller.isWinningCardUp.value &&
                      controller.isAnyCardsUp.isFalse
                  ? Container(
                      height: SizeConfig.safeBlockVertical! * 25,
                      width: SizeConfig.safeBlockHorizontal! * 35,
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
                            text: "Congratulation!",
                            fontSize: SizeConfig.safeBlockVertical! * 6,
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          Txt(
                            textAlign: TextAlign.center,
                            text:
                                "${controller.winningTeam.value} has won the match against ${controller.winningTeam.value == controller.scoreboard.value.battingTeam ? controller.scoreboard.value.bowlingTeam : controller.scoreboard.value.battingTeam}.",
                            fontSize: SizeConfig.safeBlockVertical! * 4,
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              const Spacer(),
              Column(
                children: [
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
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 30,
                                child: Obx(
                                  () => Column(
                                    children: [
                                      CustomListTile(
                                        onTogglerPressed: () =>
                                            controller.rotateStrike(),
                                        onBatsmanPressed: () =>
                                            controller.nextBatsman1(),
                                        isOnStrike: controller.scoreboard.value
                                            .batsman1.isOnStrike,
                                        name: controller
                                            .scoreboard.value.batsman1.name,
                                        runs: controller
                                            .scoreboard.value.batsman1.runs,
                                        ballFaced: controller.scoreboard.value
                                            .batsman1.ballsFaced,
                                        onDecBallsPressed: () => controller
                                            .directlyDecBallsFaced(true),
                                        onDecRunsPressed: () => controller
                                            .directlyDecRunsBatsman(true),
                                        onIncBallsPressed: () => controller
                                            .directlyIncBallsFaced(true),
                                        onIncRunsPressed: () => controller
                                            .directlyIncRunsBatsman(true),
                                      ),
                                      CustomListTile(
                                        onTogglerPressed: () =>
                                            controller.rotateStrike(),
                                        onBatsmanPressed: () =>
                                            controller.nextBatsman2(),
                                        isOnStrike: controller.scoreboard.value
                                            .batsman2.isOnStrike,
                                        name: controller
                                            .scoreboard.value.batsman2.name,
                                        runs: controller
                                            .scoreboard.value.batsman2.runs,
                                        ballFaced: controller.scoreboard.value
                                            .batsman2.ballsFaced,
                                        onDecBallsPressed: () => controller
                                            .directlyDecBallsFaced(false),
                                        onDecRunsPressed: () => controller
                                            .directlyDecRunsBatsman(false),
                                        onIncBallsPressed: () => controller
                                            .directlyIncBallsFaced(false),
                                        onIncRunsPressed: () => controller
                                            .directlyIncRunsBatsman(false),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.safeBlockHorizontal! * 1),
                              Expanded(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GradientRoundedContainer(
                                            height:
                                                SizeConfig.safeBlockVertical! *
                                                    4,
                                            width: SizeConfig
                                                    .safeBlockHorizontal! *
                                                8,
                                            gradientColors: const [
                                              ColorsManager.redColor,
                                              ColorsManager.primaryColor
                                            ],
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: SizeConfig
                                                            .safeBlockHorizontal! *
                                                        0.5,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.incScoreOnly();
                                                    },
                                                    child: Txt(
                                                      textAlign: TextAlign.end,
                                                      text:
                                                          " ${controller.scoreboard.value.totalRuns}/ ",
                                                      fontSize: SizeConfig
                                                              .blockSizeVertical! *
                                                          3,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller
                                                          .incWicketDirectly();
                                                    },
                                                    child: Txt(
                                                      textAlign: TextAlign.end,
                                                      text:
                                                          "${controller.scoreboard.value.wickets} ",
                                                      fontSize: SizeConfig
                                                              .blockSizeVertical! *
                                                          3,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig
                                                    .safeBlockHorizontal! *
                                                1.5,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () => controller
                                                    .directlyDecOver(),
                                                child: Txt(
                                                  text: "Over: ",
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical! *
                                                      3,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () => controller
                                                    .directlyIncOver(),
                                                child: Txt(
                                                  text:
                                                      "${controller.currentOver.value}.${controller.currentBall.value}",
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical! *
                                                      3,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.decrementScore();
                                            },
                                            child: Txt(
                                              text:
                                                  "${controller.scoreboard.value.battingTeam} ",
                                              fontSize: SizeConfig
                                                      .blockSizeVertical! *
                                                  3.2,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Txt(
                                            text: "vs ",
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    3,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 202, 196, 196),
                                          ),
                                          InkWell(
                                            onTap: () =>
                                                controller.decWicketDirectly(),
                                            child: Txt(
                                              text:
                                                  "${controller.scoreboard.value.bowlingTeam} ",
                                              fontSize: SizeConfig
                                                      .blockSizeVertical! *
                                                  3.2,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 1,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical! * 5,
                                      child: ListTile(
                                        title: InkWell(
                                          onTap: () => controller.nextBowler(),
                                          child: Txt(
                                            text: controller.scoreboard.value
                                                .currentBowler.name,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    3,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyDecBowlerConceededRuns(),
                                              child: SizedBox(
                                                height: SizeConfig
                                                        .blockSizeVertical! *
                                                    2,
                                                width: SizeConfig
                                                        .blockSizeVertical! *
                                                    2,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyIncBowlerConceededRuns(),
                                              child: Txt(
                                                text:
                                                    "${controller.scoreboard.value.currentBowler.runsConceded}-",
                                                fontSize: SizeConfig
                                                        .blockSizeVertical! *
                                                    3,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyIncBowlerWickets(),
                                              child: Txt(
                                                text:
                                                    "${controller.scoreboard.value.currentBowler.wicketsTaken} ",
                                                fontSize: SizeConfig
                                                        .blockSizeVertical! *
                                                    3,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyIncBowlerOverBalls(),
                                              child: Txt(
                                                text:
                                                    "(${controller.scoreboard.value.currentBowler.overs}",
                                                fontSize: SizeConfig
                                                        .blockSizeVertical! *
                                                    3,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyDecBowlerOverBalls(),
                                              child: Txt(
                                                text:
                                                    ".${controller.scoreboard.value.currentBowler.balls})",
                                                fontSize: SizeConfig
                                                        .blockSizeVertical! *
                                                    3,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyDecBowlerWickets(),
                                              child: SizedBox(
                                                height: SizeConfig
                                                        .blockSizeVertical! *
                                                    2,
                                                width: SizeConfig
                                                        .blockSizeVertical! *
                                                    2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Obx(() => ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                        .currentOverBalls
                                                        .length >
                                                    7
                                                ? 7
                                                : controller
                                                    .currentOverBalls.length,
                                            itemBuilder: (context, index) {
                                              int displayIndex = controller
                                                          .currentOverBalls
                                                          .length >
                                                      7
                                                  ? controller.currentOverBalls
                                                          .length -
                                                      7 +
                                                      index
                                                  : index;
                                              String ball =
                                                  controller.currentOverBalls[
                                                      displayIndex];
                                              return ball == ""
                                                  ? Container()
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: BallContainer(
                                                        type: ball,
                                                        size: SizeConfig
                                                                .blockSizeVertical! *
                                                            3.5,
                                                      ),
                                                    );
                                            },
                                          )),
                                    ),
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
                  Container(
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
                          CustomSquareButton(
                              text: "TO",
                              onPressed: () {
                                controller.onTOPressed();
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
