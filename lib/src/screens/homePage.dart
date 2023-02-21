import 'package:flutter/material.dart';
import 'package:gim_tracker/src/providers/user_provider.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

import '../widgets/dailyTraining.dart';
import '../widgets/welcome_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colorsApp = ColorsApp();

  @override
  Widget build(BuildContext context) {
    final userName = UserProvider().getName();

    return Scaffold(
      backgroundColor: colorsApp.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeTitle(userName: userName, colorsApp: colorsApp),
          const DailyTraining(),
        ],
      ),
    );
  }
}
