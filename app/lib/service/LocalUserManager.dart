import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User.dart';

class UserManager {
  late SharedPreferences prefs;
  User? user;

  // Initialize SharedPreferences
  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Check if user exists in SharedPreferences
  Future<bool> userExists() async {
    return prefs.containsKey('name') &&
        prefs.containsKey('email') &&
        prefs.containsKey('password');
  }

  // Save User Data in SharedPreferences
  Future<bool> setUser(User user) async {
    try {
      await prefs.setString('name', user.name!);
      await prefs.setString('email', user.email!);
      await prefs.setString('password', user.password!);
      return true;
    } catch (e) {
      print("Error saving user: $e");
      return false;
    }
  }

  // Get User Data from SharedPreferences
  Future<User> getUser() async {
    return User(
      name: prefs.getString('name') ?? 'Guest',
      email: prefs.getString('email') ?? 'No Email',
      password: prefs.getString('password') ?? '',
    );
  }

  // Remove User Data (Logout)
  Future<bool> removeUser() async {
    try {
      await prefs.remove('name');
      await prefs.remove('email');
      await prefs.remove('password');
      return true;
    } catch (e) {
      print("Error removing user: $e");
      return false;
    }
  }
}
