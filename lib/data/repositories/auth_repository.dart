import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<String> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // Simulate API request
    await Future.delayed(Duration(seconds: 2));

    if (email == "test@example.com" && password == "password") {
      await prefs.setString('userId', '12345');
      return '12345'; // Mock user ID
    } else {
      throw Exception("Invalid credentials");
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('userId');

    return userid;
  }
}
