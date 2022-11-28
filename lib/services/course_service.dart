import 'package:dio/dio.dart';
import 'package:edu_world/models/course_card_model.dart';

const token = "0eb81d85577b4362bcb0bf151210ff08";

final _dio = Dio(
  BaseOptions(
    baseUrl: '',
  ),
);

class CourseDioService {
  CourseDioService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Send Headers
          options.headers['Authorization'] = token;
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

  Future<List<CourseCardModel>> getAllCourse() async {
    try {
      final response = await _dio
          .get('/mentees/:menteesId/courses', queryParameters: {"": ""});

      List<dynamic> data = response.data['data'];
      List<CourseCardModel> result =
          data.map((e) => CourseCardModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
