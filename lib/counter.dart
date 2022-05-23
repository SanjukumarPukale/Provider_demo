import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{

  int _count = 0;
  int get counter => _count;

  void addCounter(){
    _count++;
    notifyListeners();
  }
}