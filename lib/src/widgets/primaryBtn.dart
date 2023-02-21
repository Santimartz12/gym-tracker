import 'package:flutter/material.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

class PrimaryBtnApp extends StatelessWidget {
  PrimaryBtnApp({required this.callback, required this.textValue, super.key});

  final colorsApp = ColorsApp();

  final VoidCallback callback;
  String textValue = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(colorsApp.primaryColor),
        elevation: const MaterialStatePropertyAll(0),
        minimumSize: const MaterialStatePropertyAll(Size(180, 50)),
        overlayColor:
            MaterialStatePropertyAll(colorsApp.primaryColor.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          textValue,
          style: TextStyle(color: colorsApp.fontsDarkColor, fontSize: 18),
        ),
      ),
    );
  }
}
