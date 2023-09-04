import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProvider extends
ChangeNotifier{
  bool _isDark=false;
  String _userName="";
  bool get isDark=>_isDark;
  void  toggleScreen(){
    _isDark=!_isDark;
    notifyListeners();
  }
  String get userName=>_userName;
  set userName(String userName){
    _userName=userName;
    notifyListeners();
  }



}