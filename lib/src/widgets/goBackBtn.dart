import 'package:flutter/material.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

class GoBackBtn extends StatelessWidget {
  GoBackBtn({
    Key? key,
  }) : super(key: key);

  final colorsApp = ColorsApp();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Color.fromARGB(0, 0, 0, 0))),
      onPressed: (() {
        Navigator.pop(context);
      }),
      child: Container(
        width: 100,
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              color: colorsApp.primaryColor,
              size: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'Volver',
                style: TextStyle(
                  color: colorsApp.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
