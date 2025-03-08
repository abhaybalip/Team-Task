import 'package:http/http.dart' as http;
import 'dart:convert';

import '../component/user.dart';

const String backendUrl = '';

class ServerConnector {
  // Register User
  Future<bool> registerUser(User user) async {
    if (user.email != null && user.password != null) {
      try {
        var res = await http.post(
          Uri.parse('$backendUrl/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'name': user.name,
            'email': user.email,
            'password': user.password,
          }),
        );

        if (res.statusCode == 200) {
          print("User registered successfully!");
          return true;
        } else {
          print("Failed to register user: ${res.body}");
          return false;
        }
      } catch (e) {
        print("Exception: $e");
        return false;
      }
    } else {
      print("Invalid User Data");
      return false;
    }
  }

  // Remove User
  Future<bool> removeUser(User user) async {
    if (user.email != null && user.password != null) {
      try {
        var res = await http.post(
          Uri.parse('$backendUrl/remove'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'email': user.email, 'password': user.password}),
        );

        if (res.statusCode == 200) {
          print("User removed successfully!");
          return true;
        } else {
          print("Failed to remove user: ${res.body}");
          return false;
        }
      } catch (e) {
        print("Exception: $e");
        return false;
      }
    } else {
      print("Invalid User Data");
      return false;
    }
  }

  // Authenticate User (Login)
  Future<bool> authUser(User user) async {
    if (user.email != null && user.password != null) {
      try {
        var res = await http.post(
          Uri.parse('$backendUrl/auth'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'email': user.email, 'password': user.password}),
        );

        if (res.statusCode == 200) {
          print("User authenticated successfully!");
          String token = jsonDecode(res.body)['token'];
          print("Token: $token");
          return true;
        } else {
          print("Failed to authenticate user: ${res.body}");
          return false;
        }
      } catch (e) {
        print("Exception: $e");
        return false;
      }
    } else {
      print("Invalid User Data");
      return false;
    }
  }

  // Edit User
  Future<bool> editUser(User user, User newUser) async {
    if (user.email != null && user.password != null) {
      try {
        var res = await http.post(
          Uri.parse('$backendUrl/edit'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email': user.email,
            'password': user.password,

            'newName': newUser.name,
            'newEmail': newUser.email,
            'newPassword': newUser.password,
          }),
        );

        if (res.statusCode == 200) {
          print("User details updated successfully!");
          return true;
        } else {
          print("Failed to update user: ${res.body}");
          return false;
        }
      } catch (e) {
        print("Exception: $e");
        return false;
      }
    } else {
      print("Invalid User Data");
      return false;
    }
  }
}
