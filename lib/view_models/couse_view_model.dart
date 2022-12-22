// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
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
  String errorMessage = '';
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
            .getCoursebyCategory("c22a71f9-0b9c-42f5-b9ff-f0f02c5d214b");
        uiUx = result;
        await Future.delayed(const Duration(seconds: 1));
      }
      if (category == "Front End") {
        final result = await _dioService
            .getCoursebyCategory("6bad9c9c-c089-47dc-8a5f-f902658fdab2");

        frontEnd = result;
        await Future.delayed(const Duration(seconds: 1));
      }
      if (category == "Back End") {
        final result = await _dioService
            .getCoursebyCategory("bc3c3908-7650-4efa-bb55-2cb45c870524");
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
    courseState = CourseState.loading;

    try {
      final result =
          await _dioService.getEnrolledCourseMentee(menteeId, keyword, status);
      errorMessage = '';
      if (result == '502') {
        errorMessage = result;
      }
      if (status == "ongoing") {
        courseCardModel.clear();
        courseCardModel = result;
      } else {
        endCourseCardModel = result;
      }
      if (status == '') {
        courseCardModel = result;
      }
      courseState = CourseState.none;

      // courseCardModel = result;
    } catch (e) {
      // courseState = CourseState.error;
    }
    notifyListeners();
  }

  void changeCourseToogle() {
    _isOngoing = !_isOngoing;
    notifyListeners();
  }

  Future<String> submitCompleteCourse(String menteeId, String courseId) async {
    try {
      final result = await _dioService.submitCompleteCourse(menteeId, courseId);

      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {}
      notifyListeners();
      return '';
    }
  }
}
