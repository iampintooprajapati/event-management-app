
import 'package:shared_preferences/shared_preferences.dart';

class SaveSharedPreferences {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // Save user ID on device
  static Future<void> saveUserId(String id) async {
    await preferences!.setString("userId", id);
  }

  // get user ID
  static String getUserId() {
    return preferences!.getString("userId") ?? "";
  }

  // Save user name  on device
  static Future<void> saveUserName(String name) async {
    await preferences!.setString("name", name);
  }

  // get user name
  static String getUserName() {
    return preferences!.getString("name") ?? "";
  }

  // Save user email  on device
  static Future<void> saveUserEmail(String email) async {
    await preferences!.setString("email", email);
  }

  // get user email
  static String getUserEmail() {
    return preferences!.getString("email") ?? "";
  }
}
