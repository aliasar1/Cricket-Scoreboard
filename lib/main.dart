import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:aagpl_scoreboard/views/login_screen.dart';
import 'package:aagpl_scoreboard/views/scoreboard_screen.dart';
import 'package:aagpl_scoreboard/views/setup_board_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringsManager.appName,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => AdminLoginScreen(),
        "/SetupScoreboardScreen": (context) => SetupScoreboardScreen(),
        "/ScoreboardScreen": (context) => ScoreboardScreen()
      },
    );
  }
}
