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
  List<CourseModel> uiUx = [];
  List<CourseModel> frontEnd = [];
  List<CourseModel> backEnd = [];
  List<CourseModel> keywordCourse = [];
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

  void getAllCourseByKeyword(String keyword) async {
    try {
      final result = await _dioService.getAllCourseByKeyword(keyword);
      keywordCourse = result;
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  void getCoursebyCategory(String category) async {
    courseState = CourseState.loading;

    try {
      if (category == "UI/UX") {
        final result = await _dioService
            .getCoursebyCategory("1b911bd0-d19a-4691-b250-691601800aab");
        uiUx = result;
        await Future.delayed(const Duration(seconds: 1));
      }
      if (category == "Front End") {
        final result = await _dioService
            .getCoursebyCategory("5ac5a7cd-b39f-473b-bfb9-c28f90b70229");

        frontEnd = result;
        await Future.delayed(const Duration(seconds: 1));
      }
      if (category == "Back End") {
        final result = await _dioService
            .getCoursebyCategory("fd31982e-75ad-4bb1-8d9a-786353a7ae6f");
        backEnd = result;
        await Future.delayed(const Duration(seconds: 1));
      }
      courseState = CourseState.none;
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
