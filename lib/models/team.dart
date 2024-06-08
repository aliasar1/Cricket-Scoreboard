import 'package:aagpl_scoreboard/models/batsman.dart';
import 'package:aagpl_scoreboard/models/bowler.dart';

class Team {
  String id;
  String name;
  List<Batsman>? batsmans;
  List<Bowler>? bowlers;
  bool isBatting;

  Team({
    required this.id,
    required this.name,
    this.batsmans,
    this.bowlers,
    required this.isBatting,
  });
}
