import 'package:flutter/material.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

class PrimaryBtnApp extends StatelessWidget {
  PrimaryBtnApp({required this.method, required this.textValue, super.key});

  final colorsApp = ColorsApp();

  final method;
  String textValue = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => method(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          textValue,
          style: TextStyle(color: colorsApp.fontsDarkColor, fontSize: 18),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(colorsApp.primaryColor),
        elevation: MaterialStatePropertyAll(0),
        minimumSize: MaterialStatePropertyAll(Size(180, 50)),
        overlayColor: MaterialStatePropertyAll(colorsApp.primaryColorOverlay),
      ),
    );
  }
}
