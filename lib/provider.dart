import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String gmail;
  String addclasses="";

  UserProvider({
this.gmail=""
  });

  List<String> _items = []; 

  List<String> get items => _items; 

  void addItem(String newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  void  changeUsername({
    required String newUsername
  })async{
    gmail=newUsername;
    notifyListeners();
  }
}
