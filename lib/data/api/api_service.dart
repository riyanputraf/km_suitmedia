import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia/data/models/user_model.dart';

class ApiService {
  Future<Users> listUser(http.Client client) async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1&per_page=12'));
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
