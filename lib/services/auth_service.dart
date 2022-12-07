import 'package:dio/dio.dart';

import '../models/mentees.dart';
import '../models/users.dart';

class AuthService{
  late final Dio _dio;


  AuthService(){
    _dio = Dio();
  }

   Future<String> registrasi(Users user, Mentees mentee) async {
    late final String message;
    try {
      await _dio.post(
        'https://jsonplaceholder.typicode.com/users',
        data: user.registerToMap(mentee),
      );
      message = 'Berhasil mendaftar';
    } on DioError {
      message = 'Gagal Mendaftar';
    }
    return message;
  }


  Future<String> login(Users user) async {
    late final String message;
    try {
      await _dio.post(
        'https://reqres.in/api/login',
        data: user.toMap(),
      );
      message = 'Berhasil Login';
    } on DioError {
      message = 'Gagal, Email atau Password salah!';
    }
    return message;
  }
}