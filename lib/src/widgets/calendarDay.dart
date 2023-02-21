import 'package:flutter/material.dart';
import 'package:gim_tracker/src/providers/calendar_provider.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';
import 'package:provider/provider.dart';

class CalendarDay extends StatelessWidget {
  CalendarDay({Key? key, required this.indexDay}) : super(key: key);

  final days = CalendarProvider().days;
  final colorsApp = ColorsApp();
  final int indexDay;

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    final calendar = calendarProvider.calendar;
    return Container(
      height: 60,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              //todo Abrir un input que le permita al usuario cambiar personalizadamente
              calendarProvider.changeDay(indexDay, 'Antebrazo GOD');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: colorsApp.lightColor,
              ),
              height: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.edit_outlined),
              ),
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
                          calendar[indexDay],
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
