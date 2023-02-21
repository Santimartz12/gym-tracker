import 'package:flutter/material.dart';

import '../themes/colorsApp.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    super.key,
    required this.userName,
    required this.colorsApp,
  });

  final userName;
  final ColorsApp colorsApp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
