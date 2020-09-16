import 'package:flutter/material.dart';

class NewAlarm extends StatefulWidget {
  @override
  _NewAlarmState createState() => _NewAlarmState();
}

class _NewAlarmState extends State<NewAlarm> {
  String startingDay = 'Mon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: startingDay,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              // elevation: 16,
              style: TextStyle(
                color: Colors.blue,
              ),
              underline: Container(
                height: 2,
                color: Colors.blue[800],
              ),

              onChanged: (newDay) {
                setState(() {
                  startingDay = newDay;
                  print(startingDay);
                  Navigator.pop(context);
                });
              },
              items: <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  .map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void showData() async {
    TimeOfDay newtime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child);
      },
    );
    print(newtime.hour);
    // return newtime;
  }
}
