import 'package:flutter/material.dart';
import 'package:gim_tracker/src/styles/colorsApp.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final colorsApp = ColorsApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsApp.backgroundColor,
    );
  }
}
