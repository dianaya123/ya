import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:academix_polnep/backend/models/users.dart';

class UserService {
  final String apiUrl = "http://10.0.2.2:8000/login";

  Future<users> loginUser(String nomorInduk, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nomor_induk': nomorInduk,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return users.fromJson(responseData);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<users>> fetchUser() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => users.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<users> createUser(users user) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<users> updateUser(int id, users user) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}
