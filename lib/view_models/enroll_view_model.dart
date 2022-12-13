import 'package:edu_world/services/enroll_course_service.dart';
import 'package:flutter/material.dart';

enum EnrollState { none, loading, error }

class EnrollViewModel extends ChangeNotifier {
  bool? isEnrolled;
  EnrollState enrollState = EnrollState.none;
  final _dioService = EnrollDioService();
  Future<void> enrollCourse(String courseId, String menteeId) async {
    try {
      final result = await _dioService.enrollCourse(courseId, menteeId);
      print(result);
    } catch (e) {}
    notifyListeners();
  }

  Future<void> checkEnrollmentCourse(String courseId, String menteeId) async {
    enrollState = EnrollState.loading;

    try {
      final result =
          await _dioService.checkEnrollmentCourse(courseId, menteeId);
      isEnrolled = result;
      enrollState = EnrollState.none;
    } catch (e) {
      // print('error');
      enrollState = EnrollState.error;
    }
    notifyListeners();
  }
}
