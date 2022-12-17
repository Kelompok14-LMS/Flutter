import 'package:dio/dio.dart';
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
    // _dio.interceptors.add(
    //   LogInterceptor(
    //     responseBody: true,
    //     requestBody: true,
    //   ),
    // );
  }

  Future<List<ReviewModel>> getCourseReview(String courseId) async {
    try {
      final response = await _dio.get(
        '/api/v1/courses/$courseId/reviews',
      );
      List<dynamic> data = response.data['data'];
      var data2 = response.data;
      print('data2: $data2');
      print('ini get review : $data');
      List<ReviewModel> result =
          data.map((e) => ReviewModel.fromJson(e)).toList();
      print('ini result : $result');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Future<List<ReviewModel>> getCoursebyCategory(String category) async {
  //   try {
  //     final response = await _dio.get(
  //       '/api/v1/courses/categories/$category',
  //       queryParameters: {"keyword": ""},
  //     );
  //     print("data ataaaa ${response.data["data"]}");
  //     List<dynamic> data = response.data['data'];
  //     List<ReviewModel> result =
  //         data.map((e) => ReviewModel.fromJson(e)).toList();
  //     print('dikembalikan');
  //     return result;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future getEnrolledCourseMentee(
  //     String menteeId, String keyword, String status) async {
  //   try {
  //     final response = await _dio.get(
  //       '/api/v1/mentees/$menteeId/courses',
  //       queryParameters: {"status": status, "keyword": keyword},
  //     );
  //     if (response.data['data'] != null) {
  //       List<dynamic> data = response.data['data'];
  //       List<ReviewModel> result =
  //           data.map((e) => ReviewModel.fromJson(e)).toList();
  //       return result;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<List<ReviewModel>> getPopularCourse() async {
  //   try {
  //     final response = await _dio.get(
  //       '/api/v1/courses/popular',
  //     );

  //     List<dynamic> data = response.data['data'];
  //     List<ReviewModel> result =
  //         data.map((e) => ReviewModel.fromJson(e)).toList();
  //     return result;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
