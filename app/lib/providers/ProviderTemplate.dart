import 'package:flutter/material.dart';

import 'package:app/service/LocalUserManager.dart';
import 'package:app/service/User.dart';

class ProviderTemplate with ChangeNotifier {
  final UserManager userManager = UserManager();

  Future<bool> userExists() async {
    return userManager.userExists();
  }

  Future<bool> setUser(User user) async {
    return userManager.setUser(user);
  }

  Future<User> getUser() async {
    return userManager.getUser();
  }

  Future<bool> removeUser() async {
    return userManager.removeUser();
  }

  Future<void> initPrefs() async {
    await userManager.initPrefs();
  }

  void notify() {
    notifyListeners();
  }

  void dispose() {
    super.dispose();
  }
}
