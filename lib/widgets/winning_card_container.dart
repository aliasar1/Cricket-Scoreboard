import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'custom/custom_text.dart';

class WinningCardContainer extends StatefulWidget {
  const WinningCardContainer({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  State<WinningCardContainer> createState() => _WinningCardContainerState();
}

class _WinningCardContainerState extends State<WinningCardContainer> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    super.initState();
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft.play();
    _controllerCenterRight.play();
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Container(
          height: SizeConfig.safeBlockVertical! * 10,
          width: SizeConfig.safeBlockHorizontal! * 45,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                ColorsManager.primaryColor,
                ColorsManager.lightPrimaryColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Txt(
                textAlign: TextAlign.center,
                text: "Congratulations!",
                fontSize: SizeConfig.safeBlockVertical! * 3,
                color: ColorsManager.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              Txt(
                textAlign: TextAlign.center,
                text:
                    "${widget.controller.winningTeam.value} has won the match against ${widget.controller.winningTeam.value == widget.controller.scoreboard.value.battingTeam ? widget.controller.scoreboard.value.bowlingTeam : widget.controller.scoreboard.value.battingTeam}.",
                fontSize: SizeConfig.safeBlockVertical! * 3,
                color: ColorsManager.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        Positioned(
          right: 2,
          child: ConfettiWidget(
            confettiController: _controllerCenterRight,
            blastDirection: pi, // radial value - LEFT
            emissionFrequency: 0.6,
            minimumSize: const Size(10,
                10), // set the minimum potential size for the confetti (width, height)
            maximumSize: const Size(50,
                50), // set the maximum potential size for the confetti (width, height)
            numberOfParticles: 1,
            gravity: 0.1,
            shouldLoop: false,
          ),
        ),

        //CENTER LEFT - Emit right
        Positioned(
          left: 2,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            blastDirection: 0, // radial value - RIGHT
            emissionFrequency: 0.6,
            minimumSize: const Size(10,
                10), // set the minimum potential size for the confetti (width, height)
            maximumSize: const Size(50,
                50), // set the maximum potential size for the confetti (width, height)
            numberOfParticles: 1,
            gravity: 0.1,
            shouldLoop: false,
          ),
        ),
      ],
    );
  }
}
