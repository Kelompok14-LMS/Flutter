import 'package:dio/dio.dart';
import 'package:edu_world/models/course_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'https://stagging.educatetheworld.tech',
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
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
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

  Future<List<CourseModel>> getAllCourseByKeyword(String keyword) async {
    try {
      final response = await _dio.get(
        '/api/v1/courses',
        queryParameters: {"keyword": keyword},
      );

      List<dynamic> data = response.data['data'];
      List<CourseModel> result =
          data.map((e) => CourseModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      return [];
    }
  }

  Future<List<CourseModel>> getCoursebyCategory(String category) async {
    try {
      final response = await _dio.get(
        '/api/v1/courses/categories/$category',
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
    } on DioError catch (e) {
      if (e.response!.statusCode == 502) {
        return "502";
      }
      return [];
    }
  }

  Future<List<CourseModel>> getPopularCourse() async {
    try {
      final response = await _dio.get(
        '/api/v1/courses/popular',
      );

      List<dynamic> data = response.data['data'];
      List<CourseModel> result =
          data.map((e) => CourseModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> submitCompleteCourse(String menteeId, String courseId) async {
    try {
      final response = await _dio.put(
        '/api/v1/mentees/$menteeId/courses/$courseId/complete',
      );

      final data = response.data["message"];
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
