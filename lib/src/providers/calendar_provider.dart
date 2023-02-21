import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  final List<String> days = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  final List<String> _calendar = [
    'Pecho y Triceps',
    'Espalda y Biceps',
    'Piernita',
    'Hombros',
    'Pecho y Biceps',
    'Isquios y glúteos',
    'Descanso'
  ];

  List<String> get calendar {
    return _calendar;
  }

  void changeDay(int index, String muscle) {
    _calendar[index] = muscle;
    notifyListeners();
  }
}
