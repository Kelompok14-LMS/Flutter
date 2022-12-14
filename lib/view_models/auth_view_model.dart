import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/mentees.dart';
import '../models/users.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final _serviceAuth = AuthService();

  bool _isTrue = true;
  bool _isTrue1 = true;
  bool get isTrue => _isTrue;
  bool get isTrue1 => _isTrue1;

  void toggleObs() {
    _isTrue = !_isTrue;
    notifyListeners();
  }

  void toggleObs2() {
    _isTrue1 = !_isTrue1;
    notifyListeners();
  }

  Future<String?> login(Users user) async {
    try {
      final result = await _serviceAuth.login(user);
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        return e.response!.data['message'];
      }
    }
    return null;
  }

  Future<String?> logout() async {
    try {
      final result = await _serviceAuth.logout();
      notifyListeners();
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<String?> register(Users user) async {
    try {
      final result = await _serviceAuth.register(user);
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        return e.response!.data['message'];
      }
    }
    return null;
  }

  Future<String?> registerVerify(Users user, Mentees mentees) async {
    try {
      final result = await _serviceAuth.registerVerify(user, mentees);
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        return e.response!.data['message'];
      }
    }
    return null;
  }

  Future<String?> sendOtp(String email) async {
    try {
      final result = await _serviceAuth.sendOtp(email);
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        return e.response!.data['message'];
      }
    }
    return null;
  }

  Future<String?> checkOtp(String email, String otp) async {
    try {
      final result = await _serviceAuth.checkOtp(email, otp);
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        return e.response!.data['message'];
      }
    }
    return null;
  }

  Future<String?> forgotPassword(
    String email,
    String password,
    String repeatedPassword,
    String otp,
  ) async {
    try {
      final result = await _serviceAuth.forgotPassword(
        email,
        password,
        repeatedPassword,
        otp,
      );
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        return e.response!.data['message'];
      }
    }
    return null;
  }
}
