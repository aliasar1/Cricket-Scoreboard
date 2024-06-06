import 'dart:convert';

class Bowler {
  String name;
  int runsConceded;
  int overs;
  int balls;
  int wicketsTaken;

  Bowler({
    required this.name,
    this.runsConceded = 0,
    this.overs = 0,
    this.balls = 0,
    this.wicketsTaken = 0,
  });

  void addRun(int run) {
    runsConceded += run;
  }

  void addBall() {
    balls++;
    if (balls % 6 == 0) {
      overs++;
      balls = 0;
    }
  }

  void addWicket() {
    wicketsTaken++;
  }

  Bowler copyWith({
    String? name,
    int? runsConceded,
    int? overs,
    int? balls,
    int? wicketsTaken,
  }) {
    return Bowler(
      name: name ?? this.name,
      runsConceded: runsConceded ?? this.runsConceded,
      overs: overs ?? this.overs,
      balls: balls ?? this.balls,
      wicketsTaken: wicketsTaken ?? this.wicketsTaken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'runsConceded': runsConceded,
      'overs': overs,
      'balls': balls,
      'wicketsTaken': wicketsTaken,
    };
  }

  factory Bowler.fromMap(Map<String, dynamic> map) {
    return Bowler(
      name: map['name'] as String,
      runsConceded: map['runsConceded'] as int,
      overs: map['overs'] as int,
      balls: map['balls'] as int,
      wicketsTaken: map['wicketsTaken'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bowler.fromJson(String source) =>
      Bowler.fromMap(json.decode(source) as Map<String, dynamic>);
}
