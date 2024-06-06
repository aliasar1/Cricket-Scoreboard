import 'dart:convert';

import 'batsman.dart';
import 'bowler.dart';

class Scoreboard {
  String battingTeam;
  String bowlingTeam;
  int totalRuns;
  int wickets;
  double overs;
  int target;
  Batsman batsman1;
  Batsman batsman2;
  Bowler currentBowler;

  Scoreboard({
    required this.battingTeam,
    required this.bowlingTeam,
    this.totalRuns = 0,
    this.wickets = 0,
    this.overs = 0.0,
    this.target = 0,
    required this.batsman1,
    required this.batsman2,
    required this.currentBowler,
  });

  void addRuns(int runs) {
    totalRuns += runs;
    if (batsman1.isOnStrike) {
      batsman1.addRuns(runs);
    } else {
      batsman2.addRuns(runs);
    }
    currentBowler.addRun(runs);

    if (runs % 2 != 0) {
      toggleStrike();
    }
  }

  void addBall() {
    currentBowler.addBall();
    overs += 0.1;
    if (overs - overs.truncate() >= 0.6) {
      overs = overs.truncate() + 1;
    }

    if (batsman1.isOnStrike) {
      batsman1.ballsFaced++;
    } else {
      batsman2.ballsFaced++;
    }
  }

  void addWicket() {
    wickets++;
    currentBowler.addWicket();
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'battingTeam': battingTeam,
      'bowlingTeam': bowlingTeam,
      'totalRuns': totalRuns,
      'wickets': wickets,
      'overs': overs,
      'target': target,
      'batsman1': batsman1.toMap(),
      'batsman2': batsman2.toMap(),
      'currentBowler': currentBowler.toMap(),
    };
  }

  factory Scoreboard.fromMap(Map<String, dynamic> map) {
    return Scoreboard(
      battingTeam: map['battingTeam'] as String,
      bowlingTeam: map['bowlingTeam'] as String,
      totalRuns: map['totalRuns'] as int,
      wickets: map['wickets'] as int,
      overs: map['overs'] as double,
      target: map['target'] as int,
      batsman1: Batsman.fromMap(map['batsman1'] as Map<String, dynamic>),
      batsman2: Batsman.fromMap(map['batsman2'] as Map<String, dynamic>),
      currentBowler:
          Bowler.fromMap(map['currentBowler'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Scoreboard.fromJson(String source) =>
      Scoreboard.fromMap(json.decode(source) as Map<String, dynamic>);
}
