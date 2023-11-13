import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier{
 int value = 0;

 increament(){
   value +=10;
   notifyListeners();
 }
 decreament(){
   value -= 10;
   notifyListeners();
 }
}