import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/mentees.dart';

class ProfileAPI {
  final Dio dio = Dio(
    BaseOptions(
      //baseUrl: 'https://stagging.educatetheworld.tech/api/v1',
      connectTimeout: 5000,
      receiveTimeout: 3000,
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
  Future<List<MenteesModel>> getDataProfile() async {
    try {
      final response = await dio.get(
        'http://192.168.141.239/api/assignment/get_details_profile.php',
      );
      debugPrint(response.data.toString());
      List<dynamic> data = json.decode(response.data);
      List<MenteesModel> result =
          data.map((e) => MenteesModel.fromJson(e)).toList();
      return result;
    } on DioError catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  ///Update Foto
  Future uploadFoto(String id, {required FormData formData}) async {
    try {
      final response = await dio.post(
        'http://192.168.141.239/api/assignment/upload_image.php',
        data: formData,
      );
      debugPrint(response.data.toString());
    } on DioError catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  ///Update Profile
  Future<MenteesModel?> updateProfile(MenteesModel menteesModel) async {
    try {
      final response = await dio.put(
        'http://192.168.141.239/api/assignment/edit_profile.php',
        data: menteesModel.toJson(),
      );
      debugPrint(
        response.data.toString(),
      );
      return MenteesModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }
}
