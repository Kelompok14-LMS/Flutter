import 'package:dio/dio.dart';
import 'package:edu_world/models/materials_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'https://stagging.educatetheworld.tech',
  ),
);

class MaterialDioService {
  MaterialDioService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Send Headers
          final share = await SharedPreferences.getInstance();
          final token = share.getString('token');
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
  }

  Future<Data> getPreviewModulesMaterials(String courseId) async {
    try {
      final response = await _dio.get(
        '/api/v1/courses/$courseId/details',
      );

      final data = response.data['data'];
      Data result = Data.fromJson(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future getEnrolledModulesMaterials(String menteeId, String courseId) async {
    try {
      final response =
          await _dio.get('/api/v1/mentees/$menteeId/courses/$courseId/details');

      final data = response.data['data'];
      Data result = Data.fromJson(data);
      return result;
    } on DioError catch (e) {
      if (e.response!.statusCode == 502) {
        return "502";
      }
      return [];
    }
  }

  // get material
  Future<List<Materials>> getDetailMaterials(
      String menteeId, String materialId) async {
    try {
      final response =
          await _dio.get('/api/v1/mentees/$menteeId/materials/$materialId');
      List<dynamic> data = response.data['data']['modules']['materials'];
      List<Materials> result = data.map((e) => Materials.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // get video material
  Future<List<Materials>> getVideoMaterials(
      String menteeId, String courseId) async {
    try {
      final response =
          await _dio.get('/api/v1/mentees/$menteeId/courses/$courseId/details');
      List<dynamic> data = response.data['data']['modules']['materials'];
      List<Materials> result = data.map((e) => Materials.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> submitProgress(
      String menteeId, String courseId, String materialId) async {
    try {
      final response = await _dio.post('/api/v1/mentees/progress', data: {
        "course_id": courseId,
        "mentee_id": menteeId,
        "material_id": materialId
      });
      if (response.statusCode == 201) {
        return "Sukses menambahkan data";
      }
      return "Data bermasalah";
    } on DioError catch (e) {
      debugPrint(e.toString());
      return "Data bermasalah Dio Error";
    }
  }
}
