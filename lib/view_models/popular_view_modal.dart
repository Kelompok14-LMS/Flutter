import 'package:edu_world/core.dart';
import 'package:flutter/material.dart';

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
