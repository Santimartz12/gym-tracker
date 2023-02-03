import 'package:flutter/material.dart';
import 'package:gim_tracker/src/styles/colorsApp.dart';

class CalendarDay extends StatelessWidget {
  CalendarDay({
    Key? key,
    required this.nameDay,
    required this.trainingDay,
  }) : super(key: key);

  final colorsApp = ColorsApp();

  final String nameDay;
  final String trainingDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print(trainingDay);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: colorsApp.lightColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.edit_outlined),
              ),
              height: double.infinity,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: colorsApp.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nameDay,
                        style: TextStyle(height: 1),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          trainingDay,
                          style: TextStyle(
                            fontSize: 23,
                            height: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
