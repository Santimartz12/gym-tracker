import 'package:flutter/material.dart';
import 'package:gim_tracker/src/screens/editCalendar.dart';
import 'package:gim_tracker/src/screens/homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Tracker',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/editCalendar': (context) => EditCalendar(),
      },
    );
  }
}
