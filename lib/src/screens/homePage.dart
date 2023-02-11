import 'package:flutter/material.dart';
import 'package:gim_tracker/src/providers/user_services.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

import '../widgets/dailyTraining.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colorsApp = ColorsApp();

  @override
  Widget build(BuildContext context) {
    final userName = UserServices().getName();

    return Scaffold(
      backgroundColor: colorsApp.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 42, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¡Hola ${userName}!',
                    style: TextStyle(
                      color: colorsApp.fontsLightColor,
                      fontSize: 18,
                      height: 0,
                    ),
                  ),
                  Text(
                    '¿Qué vamos a hacer hoy?',
                    style: TextStyle(
                        color: colorsApp.fontsLightColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        height: 0),
                  ),
                ],
              ),
            ),
          ),
          const DailyTraining(),
        ],
      ),
    );
  }
}
