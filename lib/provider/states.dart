import 'package:flutter/cupertino.dart';

class States extends ChangeNotifier {
  int number = 0;
  void increment() {
    number++;
    notifyListeners();
  }
}
