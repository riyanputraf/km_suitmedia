import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia/data/models/user_model.dart';

class ApiService {
  // Future<List<String>> fetchData(int page, int perPage) async {
  //   final url = 'https://reqres.in/api/users?page=$page&per_page=$perPage';
  //   final response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     // Parse the response and return the data as a list of strings
  //     // Modify this part based on your API response structure
  //     // For example:
  //     final data = <String>['Item 1', 'Item 2', 'Item 3'];
  //     return data;
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }

  Future<Users> listUser(http.Client client) async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1&per_page=12'));
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
