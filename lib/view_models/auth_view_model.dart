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

  Future<String> registrasi(Users user, Mentees mentee) {
    final result = _serviceAuth.registrasi(user, mentee);
    notifyListeners();
    return result;
  }

  Future<String> login(Users user) {
    final result = _serviceAuth.login(user);
    notifyListeners();
    return result;
  }
}
