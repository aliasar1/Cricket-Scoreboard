import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:aagpl_scoreboard/views/dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringsManager.appName,
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
