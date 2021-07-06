import 'package:flutter/material.dart';

class TestNotifier extends ChangeNotifier {
  int num = 0;
  bool isRed = true;
  void increment() {
    num += 1;
    notifyListeners();
  }

  void changeColor() {
    isRed = !isRed;
    notifyListeners();
  }
}
