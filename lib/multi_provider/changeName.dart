
import 'package:flutter/material.dart';

class ChangeName with ChangeNotifier{

  var name = 'Rashid';
  void change({required String newName}){
    name = newName;
    notifyListeners();
  }
}