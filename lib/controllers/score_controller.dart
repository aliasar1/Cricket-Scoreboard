import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../local/local_storage.dart';
import '../models/batsman.dart';
import '../models/bowler.dart';
import '../models/scoreboard.dart';

class ScoreController extends GetxController with LocalStorage {
  final TextEditingController batsman1Controller = TextEditingController();
  final TextEditingController batsman2Controller = TextEditingController();
  final TextEditingController bowlerController = TextEditingController();
  final TextEditingController battingTeamController = TextEditingController();
  final TextEditingController bowlingTeamController = TextEditingController();
  final TextEditingController totalOversController = TextEditingController();
  final TextEditingController givenTargetController = TextEditingController();
  final TextEditingController totalCurrentWicketsController =
      TextEditingController();
  final TextEditingController currentRunsController = TextEditingController();

  var currentOver = 0.obs;
  var currentBall = 0.obs;
  RxInt initScore = 0.obs;
  RxInt initWickets = 0.obs;

  var batsman1 = Batsman(name: '').obs;
  var batsman2 = Batsman(name: '').obs;
  var currentBowler = Bowler(name: '').obs;
  var lastBowler = Bowler(name: '').obs;
  var scoreboard = Scoreboard(
    battingTeam: '',
    bowlingTeam: '',
    batsman1: Batsman(name: ''),
    batsman2: Batsman(name: ''),
    currentBowler: Bowler(name: ''),
  ).obs;

  void updateBatsman(String name, String num) {
    if (num == "1") {
      scoreboard.update((sb) {
        sb?.batsman1 = Batsman(name: name, isOnStrike: true);
      });
    } else {
      scoreboard.update((sb) {
        sb?.batsman2 = Batsman(name: name);
      });
    }
  }

  void rotateStrike() {
    scoreboard.update((sb) {
      sb?.toggleStrike();
    });
  }

  void updateBattingTeamName(String name) {
    scoreboard.update((sb) {
      sb?.battingTeam = name;
    });
  }

  void updateBowlingTeamName(String name) {
    scoreboard.update((sb) {
      sb?.bowlingTeam = name;
    });
  }

  void updateBowler(String name) {
    scoreboard.update((sb) {
      sb?.currentBowler = Bowler(name: name);
    });
  }

  void updateTarget(String target) {
    scoreboard.update((sb) {
      sb?.target = int.tryParse(target) ?? 0;
    });
  }

  // void showNewBowlerSnackbar() {
  //   Get.snackbar('New Over', 'Please select a new bowler for the next over.',
  //       snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 5));
  //   Get.defaultDialog(
  //     barrierDismissible: false,
  //     title: "Select New Bowler",
  //     content: TextField(
  //       controller: bowlerController,
  //       decoration: const InputDecoration(
  //         hintText: "Enter bowler name",
  //       ),
  //     ),
  //     textConfirm: "Confirm",
  //     onConfirm: () {
  //       String bowlerName = bowlerController.text.trim();
  //       if (lastBowler.value.name == bowlerName) {
  //         Get.snackbar(
  //             'Invalid Bowler', 'The bowler cannot bowl two consecutive overs.',
  //             snackPosition: SnackPosition.TOP);
  //       } else {
  //         updateBowler(bowlerName);
  //         Get.back();
  //       }
  //     },
  //   );
  // }

  void addRuns(int runs) {
    scoreboard.update((sb) {
      sb?.addRuns(runs);
    });
    addBall();
  }

  void addWicket() {
    scoreboard.update((sb) {
      sb?.addWicket();
    });
    addBall();
  }

  void addBall() {
    scoreboard.update((sb) {
      sb?.addBall();
    });
    incrementBall();
  }

  void incrementBall() {
    currentBall.value++;
    if (currentBall.value > 5) {
      currentBall.value = 0;
      currentOver.value++;
      rotateStrike();
      // showNewBowlerSnackbar();
    }
  }

  void setupBoard() {
    scoreboard.update((sb) {
      sb?.battingTeam = battingTeamController.text;
      sb?.bowlingTeam = bowlingTeamController.text;
      sb?.batsman1 = Batsman(name: batsman1Controller.text, isOnStrike: true);
      sb?.batsman2 = Batsman(name: batsman2Controller.text);
      sb?.currentBowler = Bowler(name: bowlerController.text);
      sb?.target = int.tryParse(givenTargetController.text) ?? 0;
    });
    lastBowler.value = Bowler(name: '');
  }

  void clearBoard() {
    batsman1Controller.clear();
    batsman2Controller.clear();
    bowlerController.clear();
    battingTeamController.clear();
    bowlingTeamController.clear();
    totalOversController.clear();
    givenTargetController.clear();
    totalCurrentWicketsController.clear();
    currentRunsController.clear();

    scoreboard.value = Scoreboard(
      battingTeam: '',
      bowlingTeam: '',
      batsman1: Batsman(name: ''),
      batsman2: Batsman(name: ''),
      currentBowler: Bowler(name: ''),
    );
    lastBowler.value = Bowler(name: '');
  }
}
