import 'package:flutter/material.dart';
import 'package:academix_polnep/backend/models/users.dart';
import 'package:academix_polnep/backend/services/userService.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

  late users _user;
  users get user => _user;

  Future<bool> loginUser(String nomorInduk, String password) async {
    try {
      _user = await _userService.loginUser(nomorInduk, password);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
      // throw Exception('Failed to login user: $e');
    }
  }
}

  // Future<void> addUser(users user) async {
  //   users newUser = await _userService.createUser(user);
  //   _user.add(newUser);
  //   notifyListeners();
  // }

  // Future<void> fetchUser() async {
  //   _user = await _userService.fetchUser();
  //   notifyListeners();
  // }

  // Future<void> updateUser(int id, users user) async {
  //   users updatedUser = await _userService.updateUser(id, user);
  //   int index = _user.indexWhere((c) => c.id == id);
  //   if (index != -1) {
  //     _user[index] = updatedUser;
  //     notifyListeners();
  //   }
  // }

  // Future<void> deleteContact(int id) async {
  //   await _userService.deleteUser(id);
  //   _user.removeWhere((user) => user.id == id);
  //   notifyListeners();
  // }
