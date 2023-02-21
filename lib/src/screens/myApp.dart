import 'package:flutter/material.dart';
import 'package:gim_tracker/src/providers/calendar_provider.dart';
import 'package:provider/provider.dart';

import 'package:gim_tracker/src/screens/editCalendar.dart';
import 'package:gim_tracker/src/screens/homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalendarProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Gym Tracker',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Montserrat',
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'editCalendar': (context) => EditCalendar(),
        },
      ),
    );
  }
}
