import 'package:bookia/core/networking/api_constants.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/auth/data/models/new_user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future<dynamic> logIn(String email, String passWord) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstants.loginUrl,
        data: {"email": email, "password": passWord},
      );
      if (response?.statusCode == 200) {
        await saveToken(response!.data["data"]["token"].toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> register(NewUserModel user) async {
    try {
      final Response<dynamic>? response = await DioFactory.dio?.post(
        ApiConstants.registerUrl,
        data: {
          "name": user.name,
          "email": user.email,
          "password": user.password,
          "password_confirmation": user.passwordConfirmation,
        },
      );
      if (response?.statusCode == 201) {
        await saveToken(response!.data["data"]["token"].toString());
        return true;
      } else if (response?.statusCode == 422) {
        debugPrint("The email has already been taken.");
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
