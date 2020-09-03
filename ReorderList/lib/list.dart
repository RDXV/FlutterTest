import 'package:flutter/foundation.dart';

class InfoList extends ChangeNotifier {
  List<String> listItems = ['hola', 'hello', 'how', 'are', 'you'];

  // List<String> get getList {
  //   return listItems;
  // }

  int get listLength {
    return listItems.length;
  }

  void doubleTap(int index) {
    listItems.removeAt(index);
    print(listItems);
    notifyListeners();
  }

  // void notify() {
  //   notifyListeners();
  // }
}
