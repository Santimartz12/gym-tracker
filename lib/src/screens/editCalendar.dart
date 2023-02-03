import 'package:flutter/material.dart';
import 'package:gim_tracker/src/components/titulo.dart';
import 'package:gim_tracker/src/styles/colorsApp.dart';

import '../components/calendarDay.dart';
import '../components/goBackBtn.dart';

class EditCalendar extends StatelessWidget {
  const EditCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now().weekday;

    List<String> trainingDate = [
      'Pecho y Triceps',
      'Espalda y Biceps',
      'Piernita',
      'Hombros',
      'Pecho y Biceps',
      'Isquios y glúteos',
      'Descanso'
    ];
    List<String> days = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ];

    final colorsApp = ColorsApp();

    return Scaffold(
      backgroundColor: colorsApp.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
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
              itemCount: days.length,
              itemBuilder: (context, index) {
                final trainingDay = trainingDate[index];
                final nameDay = days[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CalendarDay(
                    nameDay: nameDay,
                    trainingDay: trainingDay,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
