import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Alarm extends ChangeNotifier {
  List<String> alarmList = [];
  List<String> alarmTime = [];
  // currently currentTime

  // Alarm(this.alarmTime, this.alarmText);

  void AddAlarm(DateTime time, String name) {
    alarmList.add(name);
    // alarmTime.add(time);
    // String finalTime = DateFormat('E, h:mm a').format(time); -> initial
    String finalTime = DateFormat('h:mm a').format(time);
    alarmTime.add(finalTime);
    notifyListeners();
    print(alarmList);
  }

  void longPressAlarm(DateTime time) {}
}
