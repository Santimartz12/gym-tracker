import 'package:flutter/material.dart';
import 'package:gim_tracker/src/providers/calendar_services.dart';
import 'package:gim_tracker/src/widgets/titulo.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';

import '../widgets/calendarDay.dart';
import '../widgets/goBackBtn.dart';
import '../widgets/primaryBtn.dart';

class EditCalendar extends StatelessWidget {
  EditCalendar({super.key});

  saveCalendarData(context) {
    //TODO: Save data and redirect to HomePage
    Navigator.pop(context);
  }

  List<String> trainingDate = CalendarServices().calendar;

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now().weekday;

    final colorsApp = ColorsApp();

    return Scaffold(
      backgroundColor: colorsApp.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GoBackBtn(),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Center(
                  child: Titulo(titulo: 'Mi calendario'),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CalendarDay(
                      indexDay: index,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Center(
                  child: PrimaryBtnApp(
                    //If this button starts to fail, check this. I don't understand how it works lol
                    method: saveCalendarData,
                    textValue: 'Guardar cambios',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
