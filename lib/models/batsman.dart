import 'dart:convert';

class Batsman {
  String name;
  int runs;
  int ballsFaced;
  bool isOnStrike;

  Batsman({
    required this.name,
    this.runs = 0,
    this.ballsFaced = 0,
    this.isOnStrike = false,
  });

  void addRuns(int run) {
    runs += run;
    ballsFaced++;
  }

  void toggleStrike() {
    isOnStrike = !isOnStrike;
  }

  Batsman copyWith({
    String? name,
    int? runs,
    int? ballsFaced,
    bool? isOnStrike,
  }) {
    return Batsman(
      name: name ?? this.name,
      runs: runs ?? this.runs,
      ballsFaced: ballsFaced ?? this.ballsFaced,
      isOnStrike: isOnStrike ?? this.isOnStrike,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'runs': runs,
      'ballsFaced': ballsFaced,
      'isOnStrike': isOnStrike,
    };
  }

  factory Batsman.fromMap(Map<String, dynamic> map) {
    return Batsman(
      name: map['name'] as String,
      runs: map['runs'] as int,
      ballsFaced: map['ballsFaced'] as int,
      isOnStrike: map['isOnStrike'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Batsman.fromJson(String source) =>
      Batsman.fromMap(json.decode(source) as Map<String, dynamic>);
}
