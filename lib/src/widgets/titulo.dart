import 'package:flutter/material.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

class Titulo extends StatelessWidget {
  Titulo({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  final String titulo;
  final colorsApp = ColorsApp();

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: TextStyle(
          color: colorsApp.fontsLightColor,
          fontWeight: FontWeight.w700,
          fontSize: 29,
          height: 0),
    );
  }
}
