import 'package:dio/dio.dart';
import 'package:edu_world/models/review_card_model.dart';
import 'package:edu_world/models/review_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'https://stagging.educatetheworld.tech',
  ),
);

class ReviewService {
  ReviewService() {
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

  Future<List<ReviewModel>> getCourseReview(String courseId) async {
    try {
      final response = await _dio.get(
        '/api/v1/courses/$courseId/reviews',
      );
      List<dynamic> data = response.data['data'];

      List<ReviewModel> result =
          data.map((e) => ReviewModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> submitReview(
      String courseId, String menteeId, String description, int rating) async {
    try {
      final response = await _dio.post('/api/v1/reviews', data: {
        "course_id": courseId,
        "mentee_id": menteeId,
        "description": description,
        "rating": rating
      });
      String data = response.data['message'];
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<ReviewCardModel> getReviewCourseWhenCompletedCourse(
      String menteeId) async {
    try {
      final response = await _dio.get(
        '/api/v1/mentees/$menteeId/reviews',
      );
      final data = response.data;
      final result = ReviewCardModel.fromJson(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
