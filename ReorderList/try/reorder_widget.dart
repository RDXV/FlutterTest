import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _list = ["Apple", "Ball", "Cat", "Dog", "Elephant"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView(
        children: _list
            .map((item) => ListTile(
                  key: Key("$item"),
                  title: Text("$item"),
                  trailing: Icon(Icons.menu),
                ))
            .toList(),
        onReorder: (int start, int current) {
          // dragging from top to bottom
          print('start is $start and current is $current');
          if (start < current) {
            int end = current - 1;
            String startItem = _list[start];
            int i = 0;
            int local = start;
            do {
              _list[local] = _list[++local];
              i++;
              print(i);
            } while (i < end - start);
            _list[end] = startItem;
          }
          // dragging from bottom to top
          else if (start > current) {
            String startItem = _list[start];
            for (int i = start; i > current; i--) {
              _list[i] = _list[i - 1];
            }
            _list[current] = startItem;
          }
          setState(() {});
        },
      ),
    );
  }
}
