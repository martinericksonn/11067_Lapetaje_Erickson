import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/user_model.dart';

class AuthController with ChangeNotifier {
  final Box accountsCache = Hive.box('accounts');
  User? currentUser;
  List<User> users = [];

  AuthController() {
    print("currentUser $currentUser");
    List result = accountsCache.get('users', defaultValue: []);
    print(result);
    for (var entry in result) {
      print(entry);
      users.add(User.fromJson(Map<String, dynamic>.from(entry)));
    }
    notifyListeners();
  }

  String register(String username, String email, String password) {
    if (userExists(email) != null) {
      return 'Error: the email is already taken';
    } else {
      users.add(User(username: username, email: email, password: password));
      saveDataToCache();
      return "User Successfully registered";
    }
  }

  bool login(String email, String password) {
    User? userSearchResult = userExists(email);
    if (userSearchResult != null) {
      bool result = userSearchResult.login(email, password);
      print("result $result");
      if (result) {
        currentUser = userSearchResult;
        notifyListeners();
      }
      print("result $currentUser");
      return result;
    } else {
      return false;
    }
  }

  logout() {
    currentUser = null;
    notifyListeners();
  }

  User? userExists(String email) {
    for (User user in users) {
      if (user.exists(email)) return user;
    }
    return null;
  }

  saveDataToCache() {
    List<Map<String, dynamic>> dataToStore = [];
    for (User user in users) {
      dataToStore.add(user.toJson());
    }
    print(dataToStore);
    accountsCache.put('users', dataToStore);
    notifyListeners();
  }

  void printUser() {
    for (var user in users) {
      print(user);
    }
  }
}
