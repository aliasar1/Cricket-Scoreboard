import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/ball_container.dart';
import '../widgets/curved_bottom_container.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/gradient_round_container.dart';

class ScoreboardScreen extends StatelessWidget {
  ScoreboardScreen({super.key});
  static const String routeName = '/scoreboard';

  final controller = Get.find<ScoreController>();

  @override
  Widget build(BuildContext context) {
    print("Data: ");
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CurvedParentContainer(
                    isLeft: true,
                    height: 100,
                    width: 140,
                    gradientColors: const [Colors.white, Colors.white70],
                    child: SizedBox(
                      width: 130,
                      child: Txt(
                        text: controller.scoreboard.value.battingTeam,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 45,
                                child: Row(
                                  children: [
                                    controller.scoreboard.value.batsman1
                                            .isOnStrike
                                        ? const Icon(
                                            Icons.arrow_right,
                                            color: Colors.green,
                                            size: 50,
                                          )
                                        : const SizedBox(
                                            width: 40,
                                          ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Txt(
                                      text: controller
                                          .scoreboard.value.batsman1.name,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      width: 200,
                                    ),
                                    Txt(
                                      text:
                                          "${controller.scoreboard.value.batsman1.runs} (${controller.scoreboard.value.batsman1.ballsFaced})",
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                child: Row(
                                  children: [
                                    controller.scoreboard.value.batsman1
                                            .isOnStrike
                                        ? const Icon(
                                            Icons.arrow_right,
                                            color: Colors.green,
                                            size: 50,
                                          )
                                        : const SizedBox(
                                            width: 40,
                                          ),
                                    Txt(
                                      text: controller
                                          .scoreboard.value.batsman2.name,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      width: 200,
                                    ),
                                    Txt(
                                      text:
                                          "${controller.scoreboard.value.batsman2.runs} (${controller.scoreboard.value.batsman2.ballsFaced})",
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Container(
                            height: 90,
                            width: 520,
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
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Txt(
                                          text:
                                              "${controller.scoreboard.value.bowlingTeam} ",
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 202, 196, 196),
                                        ),
                                        const Txt(
                                          text: "vs ",
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 202, 196, 196),
                                        ),
                                        Txt(
                                          text:
                                              "${controller.scoreboard.value.battingTeam} ",
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    GradientRoundedContainer(
                                      height: 50,
                                      width: 130,
                                      gradientColors: [
                                        ColorsManager.redColor,
                                        ColorsManager.primaryColor,
                                      ],
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Txt(
                                          textAlign: TextAlign.end,
                                          text:
                                              " ${controller.scoreboard.value.totalRuns}/${controller.scoreboard.value.wickets} ",
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 130,
                                      child: Txt(
                                        text:
                                            "Over: ${controller.scoreboard.value.overs}",
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Txt(
                                  text: "26 runs required in 12 balls",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Txt(
                                    text: controller
                                        .scoreboard.value.currentBowler.name,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    width: 200,
                                  ),
                                  Txt(
                                    text:
                                        "${controller.scoreboard.value.currentBowler.runsConceded}-1",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Txt(
                                    text:
                                        "${controller.scoreboard.value.currentBowler.overs}",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    6,
                                    (index) => const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: BallContainer(
                                        size: 40,
                                        number: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CurvedParentContainer(
                    isLeft: false,
                    height: 100,
                    width: 140,
                    gradientColors: const [Colors.white70, Colors.white],
                    child: SizedBox(
                      width: 130,
                      child: Txt(
                        text: controller.scoreboard.value.bowlingTeam,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
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
