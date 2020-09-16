import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'alarmIcon.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'NewAlarm..dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString;
  String newName;
  Alarm newAlarm;
  DateTime currentTime;
  String am = 'am';
  String startingDay = 'Mon';
  bool switchValue = false;
  // List<String> showAlarm;
  // List<DateTime> timeNow;
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _timeString,
                    // shows time on screen
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    am,
                    //shows am/pm depending on time
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 27,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<Alarm>(
                  builder: (context, alarm, child) {
                    return ListView.builder(
                      itemCount: alarm.alarmList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 10.0),
                          margin: EdgeInsets.only(bottom: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black54,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            // textBaseline: TextBaseline.ideographic,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   alarm.alarmList[index],
                                  //   style: TextStyle(
                                  //       color: switchValue == true
                                  //           ? Colors.white
                                  //           : Colors.white38,
                                  //       fontWeight: FontWeight.normal,
                                  //       fontSize: 19),
                                  // ),
                                  InkWell(
                                    child: Text(
                                      alarm.alarmTime[index].toString(),
                                      style: TextStyle(
                                          color: switchValue == true
                                              ? Colors.white70
                                              : Colors.white38,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 22),
                                    ),
                                    onDoubleTap: () async {
                                      TimeOfDay newTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (context, child) {
                                          return Theme(
                                              data: ThemeData.dark(),
                                              child: child);
                                        },
                                      );
                                      // alarm.alarmTime[index]=
                                      // The below 2 lines are important as they format TimeofDay

                                      final MaterialLocalizations
                                          localizations =
                                          MaterialLocalizations.of(context);
                                      final String formattedTimeOfDay =
                                          localizations
                                              .formatTimeOfDay(newTime);
                                      print(formattedTimeOfDay);
                                      alarm.alarmTime[index] =
                                          formattedTimeOfDay;
                                    },
                                  ),
                                  Row(
                                    children: [
                                      DropdownButton<String>(
                                        itemHeight: null,
                                        value: startingDay,

                                        icon: Icon(Icons.arrow_downward),
                                        iconSize: 20,
                                        // elevation: 16,
                                        style: TextStyle(
                                          color: switchValue == true
                                              ? Colors.white54
                                              : Colors.white38,
                                        ),

                                        onChanged: (newDay) {
                                          setState(() {
                                            startingDay = newDay;
                                            print(startingDay);
                                            Navigator.pop(context);
                                          });
                                        },
                                        items: <String>[
                                          'Mon',
                                          'Tue',
                                          'Wed',
                                          'Thu',
                                          'Fri',
                                          'Sat',
                                          'Sun'
                                        ].map<DropdownMenuItem<String>>((e) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: switchValue == true
                                                      ? Colors.white54
                                                      : Colors.white38),
                                            ),
                                            value: e,
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // To make it smaller, wrap it inside TransformScale
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                    value: switchValue,
                                    // trackColor: Colors.blue[400],
                                    activeColor: Colors.blue[400],
                                    onChanged: (bool newval) {
                                      setState(() {
                                        switchValue = newval;
                                      });
                                    }),
                              )
                              // consider changing the time format to hh:mm:ss and include days for alarms
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          child: Container(
            // see for shadows behing FAB
            // color: Colors.tealAccent[400],
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white54,
            ),
          ),
          onPressed: () {
            print('hello');
            showModalBottomSheet(
              // look for styling of modal sheet which is curved
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add Alarm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextField(
                        maxLength: 30,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.lightBlueAccent,
                        onChanged: (newString) {
                          newName = newString;
                          currentTime = DateTime.now();
                          newAlarm.AddAlarm(currentTime, newString);

                          // Changes everytime you type something so use it when pressed the ADD button
                        },
                      ),
                      FlatButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          // print('button pressed');
                          // use function addTask
                          // addTask(newTaskName);
                          Provider.of<Alarm>(context, listen: false)
                              .AddAlarm(currentTime, newName);
                          // using provider important

                          Navigator.pop(context);

                          // add task
                        },
                        child: Text(
                          'ADD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    String hours = DateFormat('H').format(dateTime);

    int hbk = int.parse(hours);
    whatTime(hbk);
    // print(am);
    // converts string to int
    return DateFormat('h:mm:ss').format(dateTime);
  }

  void whatTime(int hbk) {
    if (hbk >= 12) {
      am = 'pm';
    } else {
      am = 'am';
    }
  }
}

// Date time picker by
/*
DatePicker.showTimePicker(context,  
            showTitleActions: true,  
                onChanged: (date) {  
                 print('change $date');  
            }, onConfirm: (date) {  
                 print('confirm $date');  
            }, currentTime: DateTime.now(), locale: LocaleType.pt);
            */
