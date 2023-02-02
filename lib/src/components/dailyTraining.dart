import 'package:flutter/material.dart';
import 'package:gim_tracker/src/styles/colorsApp.dart';

class DailyTraining extends StatefulWidget {
  DailyTraining({
    Key? key,
  }) : super(key: key);

  @override
  State<DailyTraining> createState() => _DailyTrainingState();
}

class _DailyTrainingState extends State<DailyTraining> {
  final colorsApp = ColorsApp();

  var done = false;

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
                      'Brazo y antebrazo',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        height: 1,
                        letterSpacing: 0,
                        color: colorsApp.fontsDarkColor,
                      ),
                    ),
                  ),
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
                        setState(() {
                          done = !done;
                        });
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
                      onPressed: () {},
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
}
