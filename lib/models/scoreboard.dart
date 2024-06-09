import 'dart:convert';

import 'batsman.dart';
import 'bowler.dart';

class Scoreboard {
  String battingTeam;
  String bowlingTeam;
  double totalOvers;
  int totalRuns;
  int wickets;
  double overs;
  int target;
  Batsman batsman1;
  Batsman batsman2;
  Bowler currentBowler;
  List<Bowler> bowlers;
  List<Batsman> batsmen;

  Scoreboard({
    required this.battingTeam,
    required this.bowlingTeam,
    required this.totalOvers,
    this.totalRuns = 0,
    this.wickets = 0,
    this.overs = 0.0,
    this.target = 0,
    required this.batsman1,
    required this.batsman2,
    required this.currentBowler,
    List<Bowler>? bowlers,
    List<Batsman>? batsmen,
  })  : bowlers = bowlers ?? [],
        batsmen = batsmen ?? [];

  void addRuns(int runs) {
    totalRuns += runs;
    if (batsman1.isOnStrike) {
      batsman1.addRuns(runs);
      _updateBatsmanStats(batsman1, runs);
    } else {
      batsman2.addRuns(runs);
      _updateBatsmanStats(batsman2, runs);
    }
    currentBowler.addRun(runs);
    _updateBowlerStats(currentBowler, runs);

    if (runs % 2 != 0) {
      toggleStrike();
    }
  }

  void directlyIncOver() {
    overs = overs + 0.1;
  }

  void directlyDecOver() {
    overs = overs - 0.1;
  }

  void decWicketDirectly() {
    if (wickets > 0) {
      wickets--;
    }
  }

  void incWicketDirectly() {
    if (wickets < 11) {
      wickets++;
    }
  }

  void addRunWithoutRotation(int runs) {
    totalRuns += runs;
    currentBowler.addRun(runs);
    _updateBowlerStats(currentBowler, runs);
  }

  void addRunsBatsman(bool isBatsman1) {
    if (isBatsman1) {
      batsman1.addRunsDirectly();
    } else {
      batsman2.addRunsDirectly();
    }
  }

  void decRunsBatsman(bool isBatsman1) {
    if (isBatsman1) {
      if (batsman1.runs > 0) {
        batsman1.decRun();
      }
    } else {
      if (batsman2.runs > 0) {
        batsman2.decRun();
      }
    }
  }

  void incBallsFaced(bool isBatsman1) {
    if (isBatsman1) {
      batsman1.addBall();
    } else {
      batsman2.addBall();
    }
  }

  void decBallsFaced(bool isBatsman1) {
    if (isBatsman1) {
      if (batsman1.ballsFaced > 0) {
        batsman1.decBall();
      }
    } else {
      if (batsman2.ballsFaced > 0) {
        batsman2.decBall();
      }
    }
  }

  void addRunOnly(int runs) {
    totalRuns += runs;
  }

  void addBall(String ballType) {
    currentBowler.addBall();
    _updateBowlerStats(currentBowler, ballType);
    overs += 0.1;
    if (overs - overs.truncate() >= 0.6) {
      overs = overs.truncate() + 1;
    }
  }

  void decrementRun() {
    if (totalRuns > 0) {
      totalRuns--;
    }
  }

  void addWicket() {
    wickets++;
    currentBowler.addWicket();
    _updateBowlerStats(currentBowler, 'W');
    if (batsman1.isOnStrike) {
      batsman1 = Batsman(name: '');
    } else {
      batsman2 = Batsman(name: '');
    }
  }

  void toggleStrike() {
    batsman1.toggleStrike();
    batsman2.toggleStrike();
  }

  void _updateBatsmanStats(Batsman batsman, int runs) {
    bool found = false;
    for (int i = 0; i < batsmen.length; i++) {
      if (batsmen[i].name == batsman.name) {
        batsmen[i].addRuns(runs);
        found = true;
        break;
      }
    }
    if (!found) {
      batsmen.add(Batsman(name: batsman.name, runs: runs, ballsFaced: 1));
    }
  }

  void _updateBowlerStats(Bowler bowler, dynamic ballType) {
    bool found = false;

    for (int i = 0; i < bowlers.length; i++) {
      if (bowlers[i].name.toLowerCase() == bowler.name.toLowerCase()) {
        if (ballType is int) {
          bowlers[i].addRun(ballType);
        }
        found = true;
        break;
      }
    }
    if (!found) {
      if (ballType is int) {
        bowlers.add(Bowler(
            name: bowler.name,
            runsConceded: ballType,
            overs: 0,
            balls: 1,
            wicketsTaken: 0));
      } else {
        bowlers.add(Bowler(
            name: bowler.name,
            runsConceded: 0,
            overs: 1,
            balls: 0,
            wicketsTaken: 0));
      }
    }
  }

  // void displayStats() {
  //   print('Batting Team: $battingTeam');
  //   print('Total Runs: $totalRuns');
  //   print('Wickets: $wickets');
  //   print('Overs: $overs');
  //   print('Batsmen:');
  //   for (var batsman in batsmen) {
  //     print(
  //         '${batsman.name}: ${batsman.runs} runs (${batsman.ballsFaced} balls)');
  //   }
  //   print('Bowling Team: $bowlingTeam');
  //   for (var bowler in bowlers) {
  //     print(
  //         '${bowler.name}: ${bowler.runsConceded} runs, ${bowler.overs}.${bowler.balls} overs, ${bowler.wicketsTaken} wickets');
  //   }
  // }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> bowlersMap =
        bowlers.map((bowler) => bowler.toMap()).toList();
    List<Map<String, dynamic>> batsmenMap =
        batsmen.map((batsman) => batsman.toMap()).toList();
    return <String, dynamic>{
      'battingTeam': battingTeam,
      'totalOvers': totalOvers,
      'bowlingTeam': bowlingTeam,
      'totalRuns': totalRuns,
      'wickets': wickets,
      'overs': overs,
      'target': target,
      'batsman1': batsman1.toMap(),
      'batsman2': batsman2.toMap(),
      'currentBowler': currentBowler.toMap(),
      'bowlers': bowlersMap,
      'batsmen': batsmenMap,
    };
  }

  factory Scoreboard.fromMap(Map<String, dynamic> map) {
    List<dynamic> bowlersList = map['bowlers'];
    List<dynamic> batsmenList = map['batsmen'];
    return Scoreboard(
      battingTeam: map['battingTeam'] as String,
      bowlingTeam: map['bowlingTeam'] as String,
      totalRuns: map['totalRuns'] as int,
      wickets: map['wickets'] as int,
      overs: map['overs'] as double,
      totalOvers: map['totalOvers'] as double,
      target: map['target'] as int,
      batsman1: Batsman.fromMap(map['batsman1'] as Map<String, dynamic>),
      batsman2: Batsman.fromMap(map['batsman2'] as Map<String, dynamic>),
      currentBowler:
          Bowler.fromMap(map['currentBowler'] as Map<String, dynamic>),
      bowlers: bowlersList.map((item) => Bowler.fromMap(item)).toList(),
      batsmen: batsmenList.map((item) => Batsman.fromMap(item)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Scoreboard.fromJson(String source) =>
      Scoreboard.fromMap(json.decode(source) as Map<String, dynamic>);
}
