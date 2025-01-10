import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/repositories/user_repository.dart';

class UserViewmodel extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  List<User> _users = [];

  List<User> get users => _users;

  void loadUsers() {
    _users = _userRepository.getUsers();
    notifyListeners();
  }

  void saveUsers(List<User> users) {
    _userRepository.saveUsers(users);
    loadUsers();
  }
}
