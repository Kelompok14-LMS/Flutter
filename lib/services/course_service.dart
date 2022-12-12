import 'package:dio/dio.dart';
import 'package:edu_world/models/course_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'http://educatetheworld.tech',
  ),
);

class CourseDioService {
  CourseDioService() {
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

  Future<List<CourseModel>> getAllCourse() async {
    try {
      final response = await _dio.get(
        '/api/v1/courses',
        queryParameters: {"keyword": ""},
      );

      List<dynamic> data = response.data['data'];
      List<CourseModel> result =
          data.map((e) => CourseModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CourseModel>> getCoursebyCategory(String category) async {
    try {
      final response = await _dio.get(
        '/api/v1/courses/categories/$category',
        queryParameters: {"keyword": ""},
      );
      print("data ataaaa ${response.data["data"]}");
      List<dynamic> data = response.data['data'];
      List<CourseModel> result =
          data.map((e) => CourseModel.fromJson(e)).toList();
      print('dikembalikan');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future getEnrolledCourseMentee(
      String menteeId, String keyword, String status) async {
    try {
      final response = await _dio.get(
        '/api/v1/mentees/$menteeId/courses',
        queryParameters: {"status": status, "keyword": keyword},
      );
      if (response.data['data'] != null) {
        List<dynamic> data = response.data['data'];
        List<CourseModel> result =
            data.map((e) => CourseModel.fromJson(e)).toList();
        return result;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}