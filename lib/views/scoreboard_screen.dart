import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:aagpl_scoreboard/controllers/score_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/ball_container.dart';
import '../widgets/curved_bottom_container.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/custom/custom_tile.dart';
import '../widgets/gradient_round_container.dart';

class ScoreboardScreen extends StatelessWidget {
  const ScoreboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/scoreboard';

  @override
  Widget build(BuildContext context) {
    final ScoreController controller = Get.find<ScoreController>();

    return Scaffold(
      appBar: AppBar(
        title: const Txt(
          text: "AAGPL SEASON 13",
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.book),
              title: const Txt(text: "Setup Board"),
            )
          ],
        ),
      ),
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
                children: [
                  CurvedParentContainer(
                    isLeft: true,
                    height: 110,
                    width: 220,
                    gradientColors: const [Colors.white, Colors.white70],
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
                            child: Column(
                              children: [
                                CustomListTile(
                                  isOnStrike: controller
                                      .scoreboard.value.batsman1.isOnStrike,
                                  name:
                                      controller.scoreboard.value.batsman1.name,
                                  stats:
                                      "${controller.scoreboard.value.batsman1.runs} (${controller.scoreboard.value.batsman1.ballsFaced})",
                                ),
                                CustomListTile(
                                  isOnStrike: controller
                                      .scoreboard.value.batsman2.isOnStrike,
                                  name:
                                      controller.scoreboard.value.batsman2.name,
                                  stats:
                                      "${controller.scoreboard.value.batsman2.runs} (${controller.scoreboard.value.batsman2.ballsFaced})",
                                ),
                              ],
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GradientRoundedContainer(
                                        height: 50,
                                        width: 130,
                                        gradientColors: const [
                                          ColorsManager.redColor,
                                          ColorsManager.primaryColor
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
                                      const SizedBox(width: 35),
                                      Txt(
                                        text:
                                            "Over: ${controller.scoreboard.value.overs}",
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Txt(
                                        text:
                                            "${controller.scoreboard.value.bowlingTeam} ",
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      const Txt(
                                        text: "vs ",
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 202, 196, 196),
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
                                    title: Txt(
                                      text: controller
                                          .scoreboard.value.currentBowler.name,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    trailing: Txt(
                                      text:
                                          "${controller.scoreboard.value.currentBowler.runsConceded}-${controller.scoreboard.value.currentBowler.overs}",
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 16,
                                    itemBuilder: (context, index) =>
                                        const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: BallContainer(size: 40, number: 2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                    ),
                  ),
                  CurvedParentContainer(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
