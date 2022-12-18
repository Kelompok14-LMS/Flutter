import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/mentees.dart';

class ProfileAPI {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://stagging.educatetheworld.tech/api/v1',
      contentType: 'application/json',
      responseType: ResponseType.plain,
    ),
  );

  ProfileAPI() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final share = await SharedPreferences.getInstance();
          final token = share.getString('token');
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
  }

  ///Get Profile
  Future<MenteesModel> getDataProfile() async {
    try {
      final Response response = await dio.get(
        '/mentees/profile',
      );
      debugPrint(response.data.toString());
      MenteesModel result = MenteesModel.fromJson(
        jsonDecode(response.data),
      );
      return result;
    } on DioError catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  ///Update Profile
  Future updateProfile(
      {required FormData formData,
      required Function(int, int)? onSendProgress}) async {
    final share = await SharedPreferences.getInstance();
    final token = share.getString('token');
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    final menteeId = payload['mentee_id'];
    try {
      final Response response = await dio.put(
        '/mentees/$menteeId',
        onSendProgress: onSendProgress,
        data: formData,
      );
      debugPrint(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }
}
