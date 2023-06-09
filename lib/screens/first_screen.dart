import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final CalendarWeekController _controller = CalendarWeekController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              Card(
                elevation: 0,
                color: Colors.amber,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Welcome Username'),
                  subtitle: Text("Let's Check your calories today !"),
                ),
              ),
              Container(
                  decoration: BoxDecoration(),
                  child: CalendarWeek(
                    backgroundColor: Colors.amber,
                    dateBackgroundColor:
                        const Color.fromARGB(255, 255, 255, 255),
                    todayBackgroundColor:
                        const Color.fromARGB(255, 168, 168, 168),
                    dayShapeBorder: BoxShape.rectangle,
                    dayOfWeekStyle: TextStyle(color: Colors.black),
                    weekendsStyle: TextStyle(color: Colors.black),
                    pressedDateStyle:
                        TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    pressedDateBackgroundColor: Color.fromARGB(255, 81, 0, 148),
                    dateStyle:
                        TextStyle(color: const Color.fromARGB(255, 93, 0, 255)),
                    todayDateStyle: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    controller: _controller,
                    height: 120,
                    showMonth: true,
                    minDate: DateTime.now().add(
                      Duration(days: -365),
                    ),
                    maxDate: DateTime.now().add(
                      Duration(days: 365),
                    ),
                    onDatePressed: (DateTime datetime) {
                      // Do something
                      setState(() {});
                    },
                    onDateLongPressed: (DateTime datetime) {
                      // Do something
                    },
                    onWeekChanged: () {
                      // Do something
                    },
                    monthViewBuilder: (DateTime time) => Align(
                      alignment: FractionalOffset.center,
                    ),
                    decorations: [
                      DecorationItem(
                          decorationAlignment: FractionalOffset.bottomRight,
                          date: DateTime.now(),
                          decoration: Icon(
                            Icons.today,
                            color: Color.fromARGB(255, 255, 0, 0),
                          )),
                      DecorationItem(
                          date: DateTime.now().add(Duration(days: 3)),
                          decoration: Text(
                            'Holiday',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
