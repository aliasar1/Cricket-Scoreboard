// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/players_data.dart';
import '../data/teams_data.dart';
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

  final boardFormKey = GlobalKey<FormState>();

  var currentOver = 0.obs;
  var currentBall = 0.obs;
  RxInt initScore = 0.obs;
  RxInt initWickets = 0.obs;
  var currentOverBalls = <String>[].obs;
  RxBool isTargetSet = false.obs;
  RxBool isWinningCardUp = false.obs;
  RxString winningTeam = "".obs;

  var batsman1 = Batsman(name: '').obs;
  var batsman2 = Batsman(name: '').obs;
  var currentBowler = Bowler(name: '').obs;
  var lastBowler = Bowler(name: '').obs;
  var scoreboard = Scoreboard(
    totalOvers: 0.0,
    battingTeam: '',
    bowlingTeam: '',
    batsman1: Batsman(name: ''),
    batsman2: Batsman(name: ''),
    currentBowler: Bowler(name: ''),
  ).obs;

  var bowlers = <Bowler>[].obs;
  var batsmen = <Batsman>[].obs;

  @override
  void onInit() {
    super.onInit();
    bowlers.value = scoreboard.value.bowlers;
    batsmen.value = [scoreboard.value.batsman1, scoreboard.value.batsman2];
  }

  var teams = teamsAagpl.obs;
  var players = playersAagpl.obs;

  var battingTeamId = Rx<int?>(null);
  var bowlingTeamId = Rx<int?>(null);
  var batsman1Id = Rx<int?>(null);
  var batsman2Id = Rx<int?>(null);
  var bowlerId = Rx<int?>(null);

  List<Map<String, dynamic>> get battingTeamPlayers {
    if (battingTeamId.value == null) return [];
    return players
        .where((player) => player['teamId'] == battingTeamId.value)
        .toList();
  }

  List<Map<String, dynamic>> get bowlingTeamPlayers {
    if (bowlingTeamId.value == null) return [];
    return players
        .where((player) => player['teamId'] == bowlingTeamId.value)
        .toList();
  }

  RxInt currentTeamIndex = 0.obs;
  RxInt currentBatsman1Index = 0.obs;
  RxInt currentBatsman2Index = 1.obs;
  RxInt currentBowlerIndex = 0.obs;

  // CARDS ACTIONS
  RxBool isFourPressed = false.obs;
  RxBool isSixPressed = false.obs;
  RxBool isWicketPressed = false.obs;
  RxBool isNoBallPressed = false.obs;
  RxBool isLBWPressed = false.obs;
  RxBool isCatchPressed = false.obs;
  RxBool isPPPressed = false.obs;
  RxBool isROPressed = false.obs;
  RxBool isHWPressed = false.obs;
  RxBool isWideBallPressed = false.obs;
  RxBool isTOPressed = false.obs;
  RxBool isAnyCardsUp = false.obs;

  void onFourPressed() {
    isFourPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isFourPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onSixPressed() {
    isSixPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isSixPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onWicketPressed() {
    isWicketPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isWicketPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onWideBallPressed() {
    isWideBallPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isWideBallPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onNoBallPressed() {
    isNoBallPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isNoBallPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onLBWPressed() {
    isLBWPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isLBWPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onCatchPressed() {
    isCatchPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isCatchPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onPPPressed() {
    isPPPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isPPPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onROPressed() {
    isROPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isROPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onHWPressed() {
    isHWPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isHWPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void onTOPressed() {
    isTOPressed.value = true;
    isAnyCardsUp.value = true;
    Timer(const Duration(seconds: 3), () {
      isTOPressed.value = false;
      _checkAnyCardsUp();
    });
  }

  void _checkAnyCardsUp() {
    isAnyCardsUp.value = isFourPressed.value ||
        isSixPressed.value ||
        isWicketPressed.value ||
        isNoBallPressed.value ||
        isLBWPressed.value ||
        isCatchPressed.value ||
        isPPPressed.value ||
        isROPressed.value ||
        isHWPressed.value ||
        isTOPressed.value;
  }

  void nextBatsman1() {
    if (battingTeamId.value == null) return;

    List<Map<String, dynamic>> players = battingTeamPlayers;
    if (players.isEmpty) return;

    currentBatsman1Index.value++;
    if (currentBatsman1Index.value >= players.length) {
      currentBatsman1Index.value = 0;
    }

    updateBatsman(players[currentBatsman1Index.value]['name'], "1");
  }

  void nextBatsman2() {
    if (battingTeamId.value == null) return;
    List<Map<String, dynamic>> players = battingTeamPlayers;
    if (players.isEmpty) return;

    if (currentBatsman2Index.value < players.length - 1) {
      currentBatsman2Index.value++;
    } else {
      currentBatsman2Index.value = 0;
    }
    updateBatsman(players[currentBatsman2Index.value]['name'], "2");
  }

  void nextBowler() {
    if (bowlingTeamId.value == null) return;

    List<Map<String, dynamic>> players = bowlingTeamPlayers;
    if (players.isEmpty) return;

    currentBowlerIndex.value++;
    if (currentBowlerIndex.value >= players.length) {
      currentBowlerIndex.value = 0;
    }

    updateBowler(players[currentBowlerIndex.value]['name']);
  }

  void nextBattingTeam() {
    if (currentTeamIndex.value < teams.length - 1) {
      currentTeamIndex.value++;
    } else {
      currentTeamIndex.value = 0;
    }
    setBattingTeam(teams[currentTeamIndex.value]['id']);
    updateBattingTeamName(teams[currentTeamIndex.value]['name']);
  }

  void nextBowlingTeam() {
    if (currentTeamIndex.value < teams.length - 1) {
      currentTeamIndex.value++;
    } else {
      currentTeamIndex.value = 0;
    }
    setBowlingTeam(teams[currentTeamIndex.value]['id']);
    updateBowlingTeamName(teams[currentTeamIndex.value]['name']);
  }

  void setBattingTeam(int teamId) {
    battingTeamId.value = teamId;
    batsman1Id.value = null;
    batsman2Id.value = null;
  }

  void setBowlingTeam(int teamId) {
    bowlingTeamId.value = teamId;
    bowlerId.value = null;
  }

  void setBatsman1(int playerId) {
    batsman1Id.value = playerId;
  }

  void setBatsman2(int playerId) {
    batsman2Id.value = playerId;
  }

  void setBowler(int playerId) {
    bowlerId.value = playerId;
  }

  void updateBatsman(String name, String num) {
    Batsman? existingBatsman = batsmen.firstWhereOrNull(
        (batsmen) => batsmen.name.toLowerCase() == name.toLowerCase());

    if (existingBatsman != null) {
      if (num == "1") {
        scoreboard.update((sb) {
          sb?.batsman1 = existingBatsman;
          sb?.batsman2.isOnStrike = false;
        });
      } else {
        scoreboard.update((sb) {
          sb?.batsman2 = existingBatsman;
          sb?.batsman1.isOnStrike = false;
        });
      }
    } else {
      if (num == "1") {
        scoreboard.update((sb) {
          sb?.batsman1 = Batsman(name: name, isOnStrike: true);
          sb?.batsman2.isOnStrike = false;
        });
      } else {
        scoreboard.update((sb) {
          sb?.batsman2 = Batsman(name: name, isOnStrike: true);
          sb?.batsman1.isOnStrike = false;
        });
      }
      batsmen.add(Batsman(name: name));
    }
  }

  void rotateStrike() {
    scoreboard.update((sb) {
      sb?.toggleStrike();
    });
  }

  void directlyDecBallsFaced(bool isBatsman1) {
    scoreboard.update((sb) {
      sb?.decBallsFaced(isBatsman1);
    });
  }

  void directlyIncBallsFaced(bool isBatsman1) {
    scoreboard.update((sb) {
      sb?.incBallsFaced(isBatsman1);
    });
  }

  void directlyIncRunsBatsman(bool isBatsman1) {
    scoreboard.update((sb) {
      sb?.addRunsBatsman(isBatsman1);
    });
  }

  void directlyDecRunsBatsman(bool isBatsman1) {
    scoreboard.update((sb) {
      sb?.decRunsBatsman(isBatsman1);
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
    Bowler? existingBowler = bowlers.firstWhereOrNull(
        (bowler) => bowler.name.toLowerCase() == name.toLowerCase());

    if (existingBowler != null) {
      scoreboard.update((sb) {
        sb?.currentBowler = existingBowler;
      });
    } else {
      scoreboard.update((sb) {
        sb?.currentBowler = Bowler(name: name);
      });
      bowlers.add(Bowler(name: name));
    }
  }

  void updateTarget(String target) {
    scoreboard.update((sb) {
      sb?.target = int.tryParse(target) ?? 0;
    });
  }

  void addRuns(int runs, String ballType) {
    scoreboard.update((sb) {
      sb?.addRuns(runs);
    });

    addBall(ballType, runs);
  }

  void addOneRun() {
    scoreboard.update((sb) {
      sb?.addOneRun();
    });
  }

  void add2DRuns() {
    scoreboard.update((sb) {
      sb?.add2DRun();
    });
  }

  void directlyIncOver() {
    scoreboard.update((sb) {
      sb!.overs += 0.1;
      if (sb.overs - sb.overs.truncate() >= 0.6) {
        sb.overs = sb.overs.truncate() + 1;
      }
      updateCurrentOverAndBall(sb);
    });
  }

  void directlyDecOver() {
    scoreboard.update((sb) {
      double decrementAmount = sb!.overs % 1 == 0 ? 0.5 : 0.1;
      double newOvers = sb.overs - decrementAmount;
      sb.overs = newOvers < 0 ? 0.0 : newOvers;

      updateCurrentOverAndBall(sb);
    });
  }

  void directlyIncBowlerConceededRuns() {
    scoreboard.update((sb) {
      sb!.currentBowler.runsConceded++;
    });
  }

  void directlyDecBowlerConceededRuns() {
    scoreboard.update((sb) {
      if (sb!.currentBowler.runsConceded > 0) {
        sb.currentBowler.runsConceded--;
      }
    });
  }

  void directlyIncBowlerWickets() {
    scoreboard.update((sb) {
      if (sb!.currentBowler.wicketsTaken < 11) {
        sb.currentBowler.wicketsTaken++;
      }
    });
  }

  void directlyDecBowlerWickets() {
    scoreboard.update((sb) {
      if (sb!.currentBowler.wicketsTaken > 0) {
        sb.currentBowler.wicketsTaken--;
      }
    });
  }

  void directlyIncBowlerOverBalls() {
    scoreboard.update((sb) {
      if (sb!.currentBowler.balls < 5) {
        sb.currentBowler.balls++;
      } else {
        sb.currentBowler.overs++;
      }
    });
  }

  void directlyDecBowlerOverBalls() {
    scoreboard.update((sb) {
      if (sb!.currentBowler.overs >= 0) {
        if (sb.currentBowler.balls > 0) {
          sb.currentBowler.balls--;
        } else {
          if (sb.currentBowler.overs > 0) {
            sb.currentBowler.overs--;
            sb.currentBowler.balls = 5;
          }
        }
      }
    });
  }

  void updateCurrentOverAndBall(Scoreboard? sb) {
    var data = sb!.overs.toStringAsFixed(1).split(".");
    currentOver.value = int.parse(data[0]);
    currentBall.value = int.parse(data[1]);
  }

  void decWicketDirectly() {
    scoreboard.update((sb) {
      sb?.decWicketDirectly();
    });
  }

  void incWicketDirectly() {
    scoreboard.update((sb) {
      sb?.incWicketDirectly();
    });
  }

  void incScoreBy1OnlyNoBallInc(String type) {
    scoreboard.update((sb) {
      sb?.addRunWithoutRotation(1);
    });
    if (type != "") {
      currentOverBalls.add(type);
    }
  }

  void incScoreOnly() {
    scoreboard.update((sb) {
      sb?.addRunOnly(1);
    });
  }

  void decrementScore() {
    scoreboard.update((sb) {
      sb?.decrementRun();
    });
  }

  void addWicket() {
    scoreboard.update((sb) {
      sb?.addWicket();
    });
    addBall('W', 0);
  }

  void addBall(String ballType, int runs) {
    scoreboard.update((sb) {
      sb?.addBall(ballType, runs);
    });
    currentOverBalls.add(ballType);
    incrementBall();
  }

  void incrementBall() {
    if (!['NB', 'WB'].contains(currentOverBalls.last)) {
      currentBall.value++;
    }
    if (currentBall.value > 5) {
      currentBall.value = 0;
      currentOver.value++;
      rotateStrike();
      currentOverBalls.assignAll([]);
    }
    if (isTargetSet.isFalse) {
      if ((scoreboard.value.overs >= scoreboard.value.totalOvers) ||
          (scoreboard.value.wickets > 10)) {
        scoreboard.value.target = scoreboard.value.totalRuns + 1;
        isTargetSet.value = true;

        int temp = battingTeamId.value!;
        battingTeamId.value = bowlingTeamId.value;
        bowlingTeamId.value = temp;

        var battingTeam =
            teams.firstWhereOrNull((team) => team['id'] == bowlingTeamId.value);
        battingTeamController.text = battingTeam!['name'];
        var bowlingTeam =
            teams.firstWhereOrNull((team) => team['id'] == battingTeamId.value);
        bowlingTeamController.text = bowlingTeam!['name'];

        nextBatsman1();
        nextBatsman2();
        nextBowler();

        currentBall.value = 0;
        currentOver.value = 0;

        scoreboard.update((sb) {
          sb?.battingTeam = battingTeamController.text;
          sb?.batsman2.isOnStrike = false;
          sb?.bowlingTeam = bowlingTeamController.text;
          sb?.totalRuns = 0;
          sb?.wickets = 0;
          sb?.overs = 0.0;
        });
        String tempTeam = scoreboard.value.battingTeam;
        scoreboard.value.battingTeam = scoreboard.value.bowlingTeam;
        scoreboard.value.bowlingTeam = tempTeam;
      }
    } else {
      String? winner = checkWinningPossibility(scoreboard.value);
      if (winner != null) {
        isTargetSet.value = false;
        isWinningCardUp.value = true;
        winningTeam.value = winner;
      }
    }
  }

  String? checkWinningPossibility(Scoreboard scoreboard) {
    if (scoreboard.totalRuns >= scoreboard.target) {
      return scoreboard.battingTeam;
    } else if (scoreboard.wickets >= 10) {
      return scoreboard.bowlingTeam;
    } else if (scoreboard.overs >= scoreboard.totalOvers) {
      return scoreboard.bowlingTeam;
    } else {
      return null;
    }
  }

  void setupBoard() {
    if (boardFormKey.currentState!.validate()) {
      boardFormKey.currentState!.save();

      var battingTeam =
          teams.firstWhereOrNull((team) => team['id'] == battingTeamId.value);
      if (battingTeam != null) {
        battingTeamController.text = battingTeam['name'];
      } else {
        battingTeamController.clear();
      }

      var bowlingTeam =
          teams.firstWhereOrNull((team) => team['id'] == bowlingTeamId.value);
      if (bowlingTeam != null) {
        bowlingTeamController.text = bowlingTeam['name'];
      } else {
        bowlingTeamController.clear();
      }

      var batsman1 = battingTeamPlayers
          .firstWhereOrNull((player) => player['id'] == batsman1Id.value);
      if (batsman1 != null) {
        batsman1Controller.text = batsman1['name'];
      } else {
        batsman1Controller.clear();
      }

      var batsman2 = battingTeamPlayers
          .firstWhereOrNull((player) => player['id'] == batsman2Id.value);
      if (batsman2 != null) {
        batsman2Controller.text = batsman2['name'];
      } else {
        batsman2Controller.clear();
      }

      var bowler = bowlingTeamPlayers
          .firstWhereOrNull((player) => player['id'] == bowlerId.value);
      if (bowler != null) {
        bowlerController.text = bowler['name'];
      } else {
        bowlerController.clear();
      }

      givenTargetController.text = scoreboard.value.target.toString();

      totalCurrentWicketsController.clear();
      currentRunsController.clear();

      scoreboard.update((sb) {
        sb?.battingTeam = battingTeamController.text;
        sb?.bowlingTeam = bowlingTeamController.text;
        sb?.batsman1 = Batsman(name: batsman1Controller.text, isOnStrike: true);
        sb?.batsman2 = Batsman(name: batsman2Controller.text);
        sb?.currentBowler = Bowler(name: bowlerController.text);
        sb?.totalOvers = double.parse(totalOversController.text);
        sb?.target = int.tryParse(givenTargetController.text) ?? 0;
      });

      lastBowler.value = Bowler(name: '');
    }
  }

  void clearBoard() {
    // Clear text controllers
    batsman1Controller.clear();
    batsman2Controller.clear();
    bowlerController.clear();
    battingTeamController.clear();
    bowlingTeamController.clear();
    totalOversController.clear();
    givenTargetController.clear();
    totalCurrentWicketsController.clear();
    currentRunsController.clear();

    // Reset observables
    currentOver.value = 0;
    currentBall.value = 0;
    initScore.value = 0;
    initWickets.value = 0;
    currentOverBalls.clear();
    isTargetSet.value = false;
    isWinningCardUp.value = false;
    winningTeam.value = "";

    // Reset batsmen and bowler
    batsman1.value = Batsman(name: '');
    batsman2.value = Batsman(name: '');
    currentBowler.value = Bowler(name: '');
    lastBowler.value = Bowler(name: '');

    // Reset scoreboard
    scoreboard.value = Scoreboard(
      battingTeam: '',
      bowlingTeam: '',
      totalOvers: 0.0,
      batsman1: Batsman(name: ''),
      batsman2: Batsman(name: ''),
      currentBowler: Bowler(name: ''),
    );

    // Reset team and player IDs
    battingTeamId.value = null;
    bowlingTeamId.value = null;
    batsman1Id.value = null;
    batsman2Id.value = null;
    bowlerId.value = null;

    // Reset card actions
    isFourPressed.value = false;
    isSixPressed.value = false;
    isWicketPressed.value = false;
    isNoBallPressed.value = false;
    isLBWPressed.value = false;
    isCatchPressed.value = false;
    isPPPressed.value = false;
    isROPressed.value = false;
    isHWPressed.value = false;
    isWideBallPressed.value = false;
    isTOPressed.value = false;
    isAnyCardsUp.value = false;

    // Reset the list of bowlers and batsmen
    bowlers.clear();
    batsmen.clear();
  }
}
