// import 'package:flutter/material.dart';

// class ListCard extends StatefulWidget {
//   final Key key;
//   final int index;
//   final List<String> listItems;

//   ListCard(this.index, this.key, this.listItems);

//   @override
//   _ListCardState createState() => _ListCardState();
// }

// class _ListCardState extends State<ListCard> {
//   void _doubleTap() {
//     setState(() {
//       // widget.listItems.removeAt(widget.index);
//       final pos = widget.index;
//       int i;
//       widget.listItems.remove(widget.listItems[widget.index]);
//       print(widget.listItems);
//       // print(i);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GestureDetector(
//         onDoubleTap: _doubleTap,
//         child: Card(
//           margin: EdgeInsets.all(4),
//           color: Colors.white,
//           child: InkWell(
//             splashColor: Colors.blue,
//             // onTap: () => Fluttertoast.showToast(
//             //     msg: "Item ${widget.listItems[widget.index]} selected.",
//             //     toastLength: Toast.LENGTH_SHORT),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Flexible(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.all(8.0),
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           // 'Title ${widget.listItems[widget.index]}',
//                           'Title ${widget.newList.lisItems[index]}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 16),
//                           textAlign: TextAlign.left,
//                           maxLines: 5,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(8.0),
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Description ${widget.newList._listItems[widget.index]}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.normal, fontSize: 16),
//                           textAlign: TextAlign.left,
//                           maxLines: 5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                   child: Icon(
//                     Icons.reorder,
//                     color: Colors.grey,
//                     size: 24.0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
