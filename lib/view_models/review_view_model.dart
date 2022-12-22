import 'package:dio/dio.dart';
import 'package:edu_world/models/review_card_model.dart';
import 'package:edu_world/models/review_model.dart';
import 'package:flutter/foundation.dart';

import '../services/review_service.dart';

enum ReviewCourseState { none, loading, error }

class ReviewCourseViewModel with ChangeNotifier {
  final _dioService = ReviewService();
  ReviewCourseState reviewCourseState = ReviewCourseState.none;

  List<ReviewModel> _reviewCourse = [];
  List<ReviewModel> get reviewCourse => _reviewCourse;
  ReviewCardModel _reviewCardCourseModel = ReviewCardModel();
  ReviewCardModel get reviewCardCourseModel => _reviewCardCourseModel;

  Future<List<ReviewModel>> getCourseReview(String courseModel) async {
    try {
      final result = await _dioService.getCourseReview(courseModel);
      _reviewCourse.clear();
      _reviewCourse = result;
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {}
      return [];
    }
  }

  Future<ReviewCardModel> getReviewCourseByCompletedCourse(
      String courseModel) async {
    reviewCourseState = ReviewCourseState.loading;
    try {
      final result =
          await _dioService.getReviewCourseWhenCompletedCourse(courseModel);
      _reviewCardCourseModel = result;
      reviewCourseState = ReviewCourseState.none;
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {}
      reviewCourseState = ReviewCourseState.error;
      notifyListeners();
      return ReviewCardModel();
    }
  }

  Future<String> submitReview(
      String courseId, String menteeId, String description, int rating) async {
    try {
      final result = await _dioService.submitReview(
          courseId, menteeId, description, rating);
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {}
      rethrow;
    }
  }
}
