import 'package:edu_world/services/enroll_course_service.dart';
import 'package:flutter/material.dart';

enum EnrollState { none, loading, error }

class EnrollViewModel extends ChangeNotifier {
  bool? isEnrolled;
  EnrollState enrollState = EnrollState.none;
  String? mentee;
  final _dioService = EnrollDioService();
  bool addCourseSucces = false;

  void saveMenteeId(String menteeId) {
    mentee = menteeId;
  }

  Future<void> enrollCourse(String courseId, String menteeId) async {
    addCourseSucces = false;
    try {
      final result = await _dioService.enrollCourse(courseId, menteeId);
      if (result == 'Succes add Course') {
        addCourseSucces = true;
      }
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
      enrollState = EnrollState.error;
    }
    notifyListeners();
  }

  void changeIsEnrolled(bool b) {
    isEnrolled = b;
    notifyListeners();
  }
}
