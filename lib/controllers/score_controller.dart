import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../models/batsman.dart';
import '../models/bowler.dart';
import '../models/scoreboard.dart';

class ScoreController extends GetxController {
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

  var batsman1 = Batsman(name: '').obs;
  var batsman2 = Batsman(name: '').obs;
  var currentBowler = Bowler(name: '').obs;
  var scoreboard = Scoreboard(
    battingTeam: '',
    bowlingTeam: '',
    batsman1: Batsman(name: ''),
    batsman2: Batsman(name: ''),
    currentBowler: Bowler(name: ''),
  ).obs;

  void updateScore(int runs) {
    scoreboard.update((sb) {
      sb?.addRuns(runs);
    });
  }

  void updateWicket() {
    scoreboard.update((sb) {
      sb?.addWicket();
    });
  }

  void updateBall() {
    scoreboard.update((sb) {
      sb?.addBall();
    });
  }

  void setupBoard() {
    scoreboard.update((sb) {
      sb?.battingTeam = battingTeamController.text;
      sb?.bowlingTeam = bowlingTeamController.text;
      sb?.batsman1 = Batsman(name: batsman1Controller.text, isOnStrike: true);
      sb?.batsman2 = Batsman(name: batsman2Controller.text);
      sb?.currentBowler = Bowler(name: bowlerController.text);
      sb?.overs = int.tryParse(totalOversController.text) ?? 0;
      sb?.target = int.tryParse(givenTargetController.text) ?? 0;
    });
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
  }
}
