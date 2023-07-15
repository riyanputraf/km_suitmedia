import 'package:flutter/material.dart';

class SelectUserProvider extends ChangeNotifier {
  String selectedUser = '';
  String get getSelected => selectedUser;
  void setSelectedUser(String user) {
    selectedUser = user;
    notifyListeners();
  }

  // String selectedUser = '';
  // String get getSelected => selectedUser;
  // void setSelectedUser(String user) {
  //   selectedUser = user;
  //   notifyListeners();
  // }
}
