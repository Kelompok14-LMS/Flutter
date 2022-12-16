import 'package:dio/dio.dart';
import 'package:edu_world/utils/finite_state.dart';
import 'package:flutter/foundation.dart';

import '../models/mentees.dart';
import '../models/users.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final _serviceAuth = AuthService();

  ViewState _state = ViewState.none;
  ViewState get state => _state;

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

  void chagenState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<String?> login(Users user) async {
    chagenState(ViewState.loading);
    try {
      final result = await _serviceAuth.login(user);
      notifyListeners();
      chagenState(ViewState.none);
      return result;
    } catch (e) {
      if (e is DioError) {
        chagenState(ViewState.none);
        return e.response!.data['message'];
      }
      chagenState(ViewState.error);
    }
    return null;
  }

  Future<String?> logout() async {
    chagenState(ViewState.loading);
    try {
      final result = await _serviceAuth.logout();
      notifyListeners();
      chagenState(ViewState.none);
      return result;
    } catch (e) {
      chagenState(ViewState.error);
      return null;
    }
  }

  Future<String?> register(Users user) async {
    chagenState(ViewState.loading);
    try {
      final result = await _serviceAuth.register(user);
      notifyListeners();
      chagenState(ViewState.none);
      return result;
    } catch (e) {
      if (e is DioError) {
        chagenState(ViewState.none);
        return e.response!.data['message'];
      }
      chagenState(ViewState.error);
    }
    return null;
  }

  Future<String?> registerVerify(Users user, Mentees mentees) async {
    chagenState(ViewState.loading);
    try {
      final result = await _serviceAuth.registerVerify(user, mentees);
      notifyListeners();
      chagenState(ViewState.none);
      return result;
    } catch (e) {
      if (e is DioError) {
        chagenState(ViewState.none);
        return e.response!.data['message'];
      }
      chagenState(ViewState.error);
    }
    return null;
  }

  Future<String?> sendOtp(String email) async {
    chagenState(ViewState.loading);

    try {
      final result = await _serviceAuth.sendOtp(email);
      notifyListeners();
      chagenState(ViewState.none);

      return result;
    } catch (e) {
      if (e is DioError) {
        chagenState(ViewState.none);

        return e.response!.data['message'];
      }
      chagenState(ViewState.error);
    }
    return null;
  }

  Future<String?> checkOtp(String email, String otp) async {
    chagenState(ViewState.loading);

    try {
      final result = await _serviceAuth.checkOtp(email, otp);
      notifyListeners();
      chagenState(ViewState.none);
      return result;
    } catch (e) {
      if (e is DioError) {
        chagenState(ViewState.none);

        return e.response!.data['message'];
      }
      chagenState(ViewState.error);
    }
    return null;
  }

  Future<String?> forgotPassword(
    String email,
    String password,
    String repeatedPassword,
    String otp,
  ) async {
    chagenState(ViewState.loading);

    try {
      final result = await _serviceAuth.forgotPassword(
        email,
        password,
        repeatedPassword,
        otp,
      );
      notifyListeners();
      chagenState(ViewState.none);

      return result;
    } catch (e) {
      if (e is DioError) {
        chagenState(ViewState.none);

        return e.response!.data['message'];
      }
      chagenState(ViewState.error);
    }
    return null;
  }
}
