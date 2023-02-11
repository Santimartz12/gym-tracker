class CalendarServices {
  final List<String> calendar = [
    'Pecho y Triceps',
    'Espalda y Biceps',
    'Piernita',
    'Hombros',
    'Pecho y Biceps',
    'Isquios y glúteos',
    'Descanso'
  ];

  final List<String> days = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  void editCalendar(int index, String nameData) {
    calendar[index] = nameData;
  }
}
