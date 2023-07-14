import 'dart:io';

import 'package:flutter/material.dart';
import 'package:suitmedia/data/api/api_service.dart';
import 'package:suitmedia/data/models/user_model.dart';
import 'package:http/http.dart' as http;


enum ResultState { loading, noData, hasData, error }
class UserProvider extends ChangeNotifier {
  final ApiService apiService;

  UserProvider({required this.apiService}) {
    _fetchUserList();
  }

  late Users _userResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  Users get result => _userResult;

  ResultState get state => _state;

  Future<dynamic> _fetchUserList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final user = await apiService.listUser(http.Client());
      if (user.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _userResult = user;
      }
    }on SocketException catch (e){
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No internet connection';
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<void> refreshData() async {
    _fetchUserList();
  }
  String selectedUser = '';
  String get getSelected => selectedUser;
  void setSelectedUser(String user) {
    selectedUser = user;
    notifyListeners();
  }
}

class UserCoba {
  final int id;
  final String name;

  UserCoba({required this.id, required this.name});
}