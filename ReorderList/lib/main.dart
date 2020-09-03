import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list.dart';

void main() {
  // runApp(MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => InfoList(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: RunApp(),
    );
  }
}

InfoList newList;

class RunApp extends StatefulWidget {
  @override
  _RunAppState createState() => _RunAppState();
}

class _RunAppState extends State<RunApp> {
  // List<Widget> newList = [Text('hola'), Text('how'), Text('are'), Text('you')];

  // List<String> newList = ['hola', 'hello', 'how', 'are', 'you'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<InfoList>(builder: (context, infolist, child) {
        return ReorderableListView(
          children: List.generate(
              infolist.listLength,
              (index) => ListCard(index, Key('$index'), infolist.listItems, () {
                    infolist.doubleTap(index);
                  })),
          onReorder: (int oldIndex, int newIndex) {
            print('old index is $oldIndex and newIndex is $newIndex');
            setState(
              () {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }

                final String item = infolist.listItems.removeAt(oldIndex);
                print(item);
                // Try removing .getList  with the original list by making listItems public  first
                infolist.listItems.insert(newIndex, item);
              },
            );
          },
        );
      }),
    );
  }
}

//   void reorder(int oldIndex, int newIndex) {
//     print('old index is $oldIndex and newIndex is $newIndex');
//     setState(
//       () {
//         if (newIndex > oldIndex) {
//           newIndex -= 1;
//         }

//         final String item = newList.listItems.removeAt(oldIndex);
//         print(item);
//         // Try removing .getList  with the original list by making listItems public  first
//         newList.listItems.insert(newIndex, item);
//       },
//     );
//   }
// }

class ListCard extends StatefulWidget {
  final Key key;
  final int index;
  final List<String> listItems;
  final Function onDoubleTap;

  ListCard(this.index, this.key, this.listItems, this.onDoubleTap);

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  //1

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onDoubleTap: widget.onDoubleTap,
        // () {
        //   newList.listItems.removeAt(widget.index);
        //   newList.notify();
        // },
        child: Card(
          margin: EdgeInsets.all(4),
          color: Colors.white,
          child: InkWell(
            splashColor: Colors.blue,
            // onTap: () => Fluttertoast.showToast(
            //     msg: "Item ${widget.listItems[widget.index]} selected.",
            //     toastLength: Toast.LENGTH_SHORT),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          // 'Title ${widget.listItems[widget.index]}',
                          'Title ${widget.listItems[widget.index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Description ${widget.listItems[widget.index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    Icons.reorder,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 1 - void _doubleTap() {
//   setState(() {
//     // widget.listItems.removeAt(widget.index);
//     final pos = widget.index;
//     int i;
//     widget.listItems.remove(widget.listItems[widget.index]);
//     print(widget.listItems);
//     // print(i);
//   });
// }
