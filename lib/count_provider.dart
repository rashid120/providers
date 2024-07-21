
import 'package:flutter/cupertino.dart';

class CountNumberProvider with ChangeNotifier{

  int count = 0;

  void incrementNumber(){
    count++;
    notifyListeners();
  }
}