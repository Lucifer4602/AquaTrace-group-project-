import 'package:flutter/material.dart';

var changed = 0;

class listProvider extends ChangeNotifier {
  List<String> data = [];

  void remove(int index) {
    data.removeAt(index);
    notifyListeners();
  }

  void add(String textObject) {
    data.add(textObject);
    notifyListeners();
  }
  
}
