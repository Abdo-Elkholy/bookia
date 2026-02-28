import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static final Dio _dio = Dio();

  static Future<dynamic> getData(String email, String passWord) async {
    try {
      final response = await _dio.post(
        "https://codingarabic.online/api/login",
        data: {"email": email, "password": passWord},
      );
      if (response.statusCode == 200) {
        await saveToken(response.data["data"]["token"].toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
}
