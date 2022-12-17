import 'package:dio/dio.dart';
import 'package:edu_world/models/review_model.dart';
import 'package:flutter/foundation.dart';

import '../services/review_service.dart';

class ReviewCourseViewModel with ChangeNotifier {
  final _dioService = ReviewService();
  List<ReviewModel> _reviewCourse = [];
  List<ReviewModel> get reviewCourse => _reviewCourse;

  Future<List<ReviewModel>> getCourseReview(String courseModel) async {
    try {
      final result = await _dioService.getCourseReview(courseModel);
      _reviewCourse.clear();
      _reviewCourse = result;
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        print('error dio');
      }
      return [];
    }
  }
}
