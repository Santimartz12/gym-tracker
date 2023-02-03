import 'package:flutter/material.dart';
import 'package:gim_tracker/src/styles/colorsApp.dart';
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
  List<String> trainingDate = [
    'Pecho y Triceps',
    'Espalda y Biceps',
    'Piernita',
    'Hombros',
    'Pecho y Biceps',
    'Isquios y glúteos',
    'Descanso'
  ];

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
                      trainingDate[weekDay - 1],
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
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                        EdgeInsets.all(5),
                      )),
                    ),
                    IconButton(
                      onPressed: () {
                        markAsDone();
                      },
                      icon: done
                          ? Icon(Icons.cancel_outlined)
                          : Icon(Icons.task_alt_rounded),
                      iconSize: 48,
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(5),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/editCalendar');
                      },
                      icon: const Icon(Icons.calendar_month),
                      iconSize: 36,
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(5),
                        ),
                      ),
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
