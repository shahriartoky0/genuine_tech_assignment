import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/user_details_model.dart';

class AuthController {
  static String? token;
  static UserDetails? user;

  static Future<void> saveUserInformation(String t, UserDetails model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', t);
    sharedPreferences.setString('user', jsonEncode(model.toJson()));
    token = t;
    user = model ;
  }
  static Future<void> updateUserInformation(UserDetails model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user', jsonEncode(model.toJson()));
    user = model ;
  }

  static Future<void> initializeUserCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    user = UserDetails.fromJson(
        jsonDecode(sharedPreferences.getString('user') ?? '{}'));
  }

  static Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      await initializeUserCache();
      return true;
    }
    return false;
  }
  static Future <void> clearAuthData ()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear() ;
    token = null ;
  }
}