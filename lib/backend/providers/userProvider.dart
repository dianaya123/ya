import 'package:flutter/material.dart';
import 'package:academix_polnep/backend/models/users.dart';
import 'package:academix_polnep/backend/services/userService.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

  Users? _user;
  Users? get user => _user;

  Future<Users?> loginUser(String nomorInduk, String password) async {
    try {
      _user = await _userService.loginUser(nomorInduk, password);
      notifyListeners();
      return _user;
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  Future<void> fetchUser() async {
    try {
      _user = await _userService.fetchUser();
      notifyListeners();
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  Future<void> addUser(Users user) async {
    Users newUser = await _userService.createUser(user);
    _user = newUser;
    notifyListeners();
  }

  Future<void> updateUser(int id, Users user) async {
    Users updatedUser = await _userService.updateUser(id, user);
    if (_user != null && _user!.id == id) {
      _user = updatedUser;
      notifyListeners();
    }
  }

  Future<void> deleteUser(int id) async {
    await _userService.deleteUser(id);
    if (_user != null && _user!.id == id) {
      _user = null;
      notifyListeners();
    }
  }
}
