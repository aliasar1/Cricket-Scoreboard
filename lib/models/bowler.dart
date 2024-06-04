import 'dart:convert';

class Bowler {
  String name;
  int runsConceded;
  double overs;

  Bowler({
    required this.name,
    this.runsConceded = 0,
    this.overs = 0.0,
  });

  void addRun(int run) {
    runsConceded += run;
  }

  void addBall() {
    overs += 0.1;
    if (overs - overs.truncate() >= 0.6) {
      overs = overs.truncate() + 1;
    }
  }

  Bowler copyWith({
    String? name,
    int? runsConceded,
    double? overs,
  }) {
    return Bowler(
      name: name ?? this.name,
      runsConceded: runsConceded ?? this.runsConceded,
      overs: overs ?? this.overs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'runsConceded': runsConceded,
      'overs': overs,
    };
  }

  factory Bowler.fromMap(Map<String, dynamic> map) {
    return Bowler(
      name: map['name'] as String,
      runsConceded: map['runsConceded'] as int,
      overs: map['overs'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bowler.fromJson(String source) =>
      Bowler.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Bowler(name: $name, runsConceded: $runsConceded, overs: $overs)';

  @override
  bool operator ==(covariant Bowler other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.runsConceded == runsConceded &&
        other.overs == overs;
  }

  @override
  int get hashCode => name.hashCode ^ runsConceded.hashCode ^ overs.hashCode;
}
