import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:academix_polnep/backend/models/users.dart';

class UserService {
  final String apiUrl = "https://academix.risetmaster.my.id/public/api/login";

  Future<Users> loginUser(String nomorInduk, String password) async {
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
      return Users.fromJson(responseData);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<Users> fetchUser() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Users.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch user: ${response.body}');
    }
  }

  Future<Users> createUser(Users user) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user: ${response.body}');
    }
  }

  Future<Users> updateUser(int id, Users user) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user: ${response.body}');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user: ${response.body}');
    }
  }
}
