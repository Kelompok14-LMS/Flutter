import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'http://educatetheworld.tech',
  ),
);

class EnrollDioService {
  EnrollDioService() {
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

  Future<String> enrollCourse(String courseId, String menteeId) async {
    try {
      final response = await _dio.post(
        '/api/v1/courses/enroll-course',
        data: {
          "course_id": courseId,
          "mentee_id": menteeId,
        },
      );

      return response.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkEnrollmentCourse(String courseId, String menteeId) async {
    try {
      final response = await _dio.get(
        '/api/v1/mentees/$menteeId/courses/$courseId',
      );
      print('apinya jalan');
      return response.data['data']['status_enrollment'];
    } catch (e) {
      rethrow;
    }
  }
}
