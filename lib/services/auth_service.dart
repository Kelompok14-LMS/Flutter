import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/mentees.dart';
import '../models/users.dart';

class AuthService {
  late final Dio _dio;
  final baseUrl = 'https://stagging.educatetheworld.tech/api/v1';

  AuthService() {
    _dio = Dio();
  }

  Future<String> login(Users user) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl/auth/mentee/login',
        data: user.toMap(),
      );
      if (response.statusCode == 200 && response.data != null) {
        final String token = response.data['data']['token'];
        final helper = await SharedPreferences.getInstance();
        await helper.setString('token', token);
        print(token);
        return response.data['message'];
      } else if (response.statusCode == 409) {
        return response.data['message'];
      } else {
        return response.data['message'];
      }
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String?> logout() async {
    try {
      final helper = await SharedPreferences.getInstance();
      await helper.remove('token');
      return 'Logout succesful';
    } catch (e) {
      return null;
    }
  }

  Future<String> register(Users user) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl/auth/mentee/register',
        data: user.toMap(),
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> registerVerify(Users user, Mentees mentee) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl/auth/mentee/register/verify',
        data: user.registerToMap(mentee),
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> sendOtp(String email) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl/auth/send-otp',
        data: {'email': email},
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> checkOtp(String email, String otp) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl/auth/check-otp',
        data: {'email': email, 'otp': otp},
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> forgotPassword(
    String email,
    String password,
    String repeatedPassword,
    String otp,
  ) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl/auth/forgot-password',
        data: {
          'email': email,
          'password': password,
          'repeated_password': repeatedPassword,
          'otp': otp
        },
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }
}
