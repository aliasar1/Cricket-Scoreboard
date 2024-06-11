import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/fonts.dart';
import '../constants/values.dart';
import '../widgets/ball_container.dart';
import '../widgets/curved_bottom_container.dart';
import '../widgets/custom/custom_button.dart';
import '../widgets/custom/custom_rounded_button.dart';
import '../widgets/custom/custom_squared_button.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_text_form_field.dart';
import '../widgets/custom/custom_tile.dart';
import '../widgets/gradient_round_container.dart';
import '../widgets/image_container.dart';

class ScoreboardScreen extends StatelessWidget {
  ScoreboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/ScoreboardScreen';

  final ScoreController controller = Get.find<ScoreController>();
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 40,
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
                      height: 250,
                      width: 350,
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
                          const Txt(
                            textAlign: TextAlign.center,
                            text: "Target",
                            fontSize: 50,
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          Txt(
                            textAlign: TextAlign.center,
                            text: controller.scoreboard.value.target.toString(),
                            fontSize: 120,
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
                      height: 250,
                      width: 600,
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
                          const Txt(
                            textAlign: TextAlign.center,
                            text: "Congratulation!",
                            fontSize: 50,
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          Txt(
                            textAlign: TextAlign.center,
                            text:
                                "${controller.winningTeam.value} has won the match against ${controller.winningTeam.value == controller.scoreboard.value.battingTeam ? controller.scoreboard.value.bowlingTeam : controller.scoreboard.value.battingTeam}.",
                            fontSize: 40,
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
                            height: 110,
                            width: 220,
                            gradientColors: const [
                              Colors.white,
                              Colors.white70
                            ],
                            child: SizedBox(
                              width: 200,
                              child: Txt(
                                textAlign: TextAlign.center,
                                text: controller.scoreboard.value.battingTeam,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 110,
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
                                width: 550,
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
                              const SizedBox(width: 25),
                              Expanded(
                                child: Container(
                                  height: 105,
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
                                            height: 50,
                                            width: 160,
                                            gradientColors: const [
                                              ColorsManager.redColor,
                                              ColorsManager.primaryColor
                                            ],
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.incScoreOnly();
                                                    },
                                                    child: Txt(
                                                      textAlign: TextAlign.end,
                                                      text:
                                                          " ${controller.scoreboard.value.totalRuns}/ ",
                                                      fontSize: 36,
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
                                                      fontSize: 36,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 35),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () => controller
                                                    .directlyDecOver(),
                                                child: const Txt(
                                                  text: "Over: ",
                                                  fontSize: 30,
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
                                                  fontSize: 30,
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
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Txt(
                                            text: "vs ",
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 202, 196, 196),
                                          ),
                                          InkWell(
                                            onTap: () =>
                                                controller.decWicketDirectly(),
                                            child: Txt(
                                              text:
                                                  "${controller.scoreboard.value.bowlingTeam} ",
                                              fontSize: 32,
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
                              const SizedBox(width: 25),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: ListTile(
                                        title: InkWell(
                                          onTap: () => controller.nextBowler(),
                                          child: Txt(
                                            text: controller.scoreboard.value
                                                .currentBowler.name,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyDecBowlerConceededRuns(),
                                              child: const SizedBox(
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyIncBowlerConceededRuns(),
                                              child: Txt(
                                                text:
                                                    "${controller.scoreboard.value.currentBowler.runsConceded}-",
                                                fontSize: 30,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyIncBowlerWickets(),
                                              child: Txt(
                                                text:
                                                    "${controller.scoreboard.value.currentBowler.wicketsTaken} ",
                                                fontSize: 30,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyIncBowlerOverBalls(),
                                              child: Txt(
                                                text:
                                                    "(${controller.scoreboard.value.currentBowler.overs}",
                                                fontSize: 30,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyDecBowlerOverBalls(),
                                              child: Txt(
                                                text:
                                                    ".${controller.scoreboard.value.currentBowler.balls})",
                                                fontSize: 30,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .directlyDecBowlerWickets(),
                                              child: const SizedBox(
                                                height: 40,
                                                width: 40,
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
                                                    8
                                                ? 8
                                                : controller
                                                    .currentOverBalls.length,
                                            itemBuilder: (context, index) {
                                              int displayIndex = controller
                                                          .currentOverBalls
                                                          .length >
                                                      8
                                                  ? controller.currentOverBalls
                                                          .length -
                                                      8 +
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
                                                        size: 40,
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
                          height: 110,
                          width: 220,
                          gradientColors: const [Colors.white70, Colors.white],
                          child: Center(
                            child: SizedBox(
                              width: 200,
                              child: Txt(
                                textAlign: TextAlign.center,
                                text: controller.scoreboard.value.bowlingTeam,
                                fontSize: 35,
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
                    height: 60,
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

  Future<dynamic> buildUpdateTeam1Name(
      ScoreController controller, bool isBattingTeam) {
    return Get.defaultDialog(
      title: "Update Team",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
          color: ColorsManager.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: FontSize.titleFontSize),
      titlePadding:
          const EdgeInsets.symmetric(vertical: PaddingManager.paddingM),
      radius: 5,
      content: Column(
        children: [
          CustomTextFormField(
            controller: isBattingTeam
                ? controller.battingTeamController
                : controller.bowlingTeamController,
            labelText: "Name",
            prefixIconData: Icons.person,
            textInputAction: TextInputAction.next,
            autofocus: false,
          ),
          const SizedBox(height: SizeManager.sizeM),
          CustomButton(
            color: ColorsManager.primaryColor,
            onPressed: () {
              isBattingTeam
                  ? controller.updateBattingTeamName(
                      controller.battingTeamController.text.trim())
                  : controller.updateBowlingTeamName(
                      controller.bowlingTeamController.text.trim());
              Get.back();
            },
            text: "Update",
            hasInfiniteWidth: true,
            textColor: ColorsManager.whiteColor,
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildUpdateBowlerDialog(ScoreController controller) {
    return Get.defaultDialog(
      title: "Update Bowler",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
          color: ColorsManager.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: FontSize.titleFontSize),
      titlePadding:
          const EdgeInsets.symmetric(vertical: PaddingManager.paddingM),
      radius: 5,
      content: Column(
        children: [
          CustomTextFormField(
            controller: controller.bowlerController,
            labelText: "Name",
            prefixIconData: Icons.person,
            textInputAction: TextInputAction.next,
            autofocus: false,
          ),
          const SizedBox(height: SizeManager.sizeM),
          CustomButton(
            color: ColorsManager.primaryColor,
            onPressed: () {
              controller.updateBowler(controller.bowlerController.text.trim());
              Get.back();
            },
            text: "Update",
            hasInfiniteWidth: true,
            textColor: ColorsManager.whiteColor,
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildUpdateBatsmanDialog(
      ScoreController controller, String number) {
    return Get.defaultDialog(
      title: "Update Batsman",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
          color: ColorsManager.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: FontSize.titleFontSize),
      titlePadding:
          const EdgeInsets.symmetric(vertical: PaddingManager.paddingM),
      radius: 5,
      content: Column(
        children: [
          CustomTextFormField(
            controller: number == "1"
                ? controller.batsman1Controller
                : controller.batsman2Controller,
            labelText: "Name",
            prefixIconData: Icons.person,
            textInputAction: TextInputAction.next,
            autofocus: false,
          ),
          const SizedBox(height: SizeManager.sizeM),
          CustomButton(
            color: ColorsManager.primaryColor,
            onPressed: () {
              number == "1"
                  ? controller.updateBatsman(
                      controller.batsman1Controller.text.trim(), number)
                  : controller.updateBatsman(
                      controller.batsman2Controller.text.trim(), number);
              Get.back();
            },
            text: "Update",
            hasInfiniteWidth: true,
            textColor: ColorsManager.whiteColor,
          ),
        ],
      ),
    );
  }
}
