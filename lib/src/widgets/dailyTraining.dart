import 'package:flutter/material.dart';
import 'package:gim_tracker/src/providers/calendar_provider.dart';
import 'package:gim_tracker/src/themes/colorsApp.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyTraining extends StatefulWidget {
  const DailyTraining({
    Key? key,
  }) : super(key: key);

  @override
  State<DailyTraining> createState() => _DailyTrainingState();
}

Future<bool> getSavedValue() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('dayDone') ?? false;
}

class _DailyTrainingState extends State<DailyTraining> {
  var weekDay = DateTime.now().weekday;

  final colorsApp = ColorsApp();

  bool done = false;

  @override
  void initState() {
    super.initState();
    getSavedValue().then((value) {
      setState(() {
        done = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    final calendar = calendarProvider.calendar;
    //* Estilo de los iconos
    const buttonStyle = ButtonStyle(
      padding: MaterialStatePropertyAll(
        EdgeInsets.all(5),
      ),
      iconColor: MaterialStatePropertyAll(Colors.black),
    );

    return Center(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: done ? colorsApp.doneColor : colorsApp.primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(18),
          ),
        ),
        width: MediaQuery.of(context).size.width - 40,
        duration: Duration(milliseconds: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hoy es día de:',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: colorsApp.fontsDarkColor,
                        height: 2),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 130,
                    child: Text(
                      calendar[weekDay - 1],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        height: 1,
                        letterSpacing: 0,
                        color: colorsApp.fontsDarkColor,
                      ),
                    ),
                  ),
                  done
                      ? Text(
                          'Completado',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.5,
                            height: 1.7,
                            color: colorsApp.fontsDarkColor,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: colorsApp.lightColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(18),
                    topRight: Radius.circular(18),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),

                //Listado de botones
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.cached),
                      iconSize: 36,
                      style: buttonStyle,
                    ),
                    IconButton(
                      onPressed: () {
                        markAsDone();
                      },
                      icon: done
                          ? Icon(Icons.cancel_outlined)
                          : Icon(Icons.task_alt_rounded),
                      iconSize: 48,
                      style: buttonStyle,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'editCalendar');
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                      iconSize: 36,
                      style: buttonStyle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  markAsDone() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('dayDone', !done);

    setState(() {
      done = !done;
    });
  }
}
