// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:edu_world/services/course_service.dart';

import '../models/course_model.dart';

enum CourseState { none, loading, error }

class CourseViewModel with ChangeNotifier {
  final _dioService = CourseDioService();
  final ScrollController scrollController = ScrollController();
  CourseState courseState = CourseState.none;
  List<CourseModel> courseCardModel = [];
  List<CourseModel> endCourseCardModel = [];
  List<CourseModel> allCourse = [];
  final String _token = '';
  String get tokenUser => _token;
  bool _isOngoing = true;
  bool get isOngoing => _isOngoing;

  void getAllCourse() async {
    courseState = CourseState.loading;

    try {
      final result = await _dioService.getAllCourse();
      courseState = CourseState.none;
      allCourse = result;
    } catch (e) {
      courseState = CourseState.error;
    }
    notifyListeners();
  }

  void getEnrolledCourseMentee(
      String menteeId, String keyword, String status) async {
    // courseState = CourseState.loading;

    try {
      final result =
          await _dioService.getEnrolledCourseMentee(menteeId, keyword, status);
      if (status == "ongoing") {
        courseCardModel.clear();
        courseCardModel = result;
      } else {
        endCourseCardModel = result;
      }
      // courseState = CourseState.none;

      courseCardModel = result;
    } catch (e) {
      // courseState = CourseState.error;
    }
    notifyListeners();
  }

  void changeCourseToogle() {
    _isOngoing = !_isOngoing;
    notifyListeners();
  }
}
