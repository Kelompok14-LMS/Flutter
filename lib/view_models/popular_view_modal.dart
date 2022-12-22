import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../services/course_service.dart';

class PopularViewModel extends ChangeNotifier {
  final _dioService = CourseDioService();
  List<CourseModel> popularCourse = [];
  Future<void> getPopularCourse() async {
    try {
      final result = await _dioService.getPopularCourse();
      popularCourse = result;
    } catch (e) {}
    notifyListeners();
  }
}
