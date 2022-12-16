import 'package:dio/dio.dart';
import 'package:edu_world/models/materials_model.dart';
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
    // _dio.interceptors.add(
    //   LogInterceptor(
    //     responseBody: true,
    //     requestBody: true,
    //   ),
    // );
  }

  Future<List<Modules>> getPreviewModulesMaterials(String courseId) async {
    try {
      final response = await _dio.get(
        '/api/v1/courses/$courseId/details',
      );

      List<dynamic> data = response.data['data']['modules'];
      List<Modules> result = data.map((e) => Modules.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
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
}
