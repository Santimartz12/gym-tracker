import 'package:flutter/material.dart';
import 'package:gim_tracker/src/providers/calendar_services.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

class CalendarDay extends StatelessWidget {
  CalendarDay({Key? key, required this.indexDay}) : super(key: key);

  final days = CalendarServices().days;
  final exercises = CalendarServices().calendar;
  final colorsApp = ColorsApp();
  final int indexDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print(indexDay);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: colorsApp.lightColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.edit_outlined),
              ),
              height: double.infinity,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
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
                        days[indexDay],
                        style: TextStyle(
                          height: 1,
                          color: colorsApp.fontsDarkColor,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          exercises[indexDay],
                          style: TextStyle(
                            color: colorsApp.fontsDarkColor,
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
