import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/alarmIcon.dart';
import 'alarm.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Alarm(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Time Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Time Demo'),
    );
  }
}
