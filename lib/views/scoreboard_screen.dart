import 'package:flutter/material.dart';

import '../widgets/ball_container.dart';
import '../widgets/curved_bottom_container.dart';
import '../widgets/custom/custom_text.dart';
import '../widgets/gradient_round_container.dart';

class ScoreboardScreen extends StatelessWidget {
  const ScoreboardScreen({super.key});

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
        child: Column(
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
                  child: Container(
                    width: 130,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logos/pak.png'),
                        fit: BoxFit.contain,
                      ),
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
                        const Column(
                          children: [
                            SizedBox(
                              height: 45,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Txt(
                                    text: "Ali Asar",
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Txt(
                                    text: "91 (41)",
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
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Txt(
                                    text: "Sanif Ali",
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Txt(
                                    text: "12 (8)",
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
                            color: Color.fromARGB(255, 1, 58, 105),
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Txt(
                                        text: "PAK ",
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 202, 196, 196),
                                      ),
                                      Txt(
                                        text: "vs ",
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 202, 196, 196),
                                      ),
                                      Txt(
                                        text: "IND ",
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
                                      Colors.redAccent,
                                      Color.fromARGB(255, 1, 58, 105),
                                    ],
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Txt(
                                        textAlign: TextAlign.end,
                                        text: " 104/2 ",
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
                                      text: "Over: 5.2",
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Txt(
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
                            const Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Txt(
                                  text: "Jarif",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Txt(
                                  text: "26-0",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Txt(
                                  text: "1.2",
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
                  child: Container(
                    width: 130,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logos/india.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
