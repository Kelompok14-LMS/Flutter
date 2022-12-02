import 'package:edu_world/services/course_service.dart';
import 'package:flutter/material.dart';

import '../models/course_model.dart';

enum CourseState { none, loading, error }

class CourseViewModel with ChangeNotifier {
  final _dioService = CourseDioService();
  final ScrollController scrollController = ScrollController();
  late double topBarOpacity = 0.0;
  CourseState courseState = CourseState.none;
  List<CourseModel> courseCardModel = [];

  /// for CourseScreen & FavoriteScreen
  void scrollControll() {
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          topBarOpacity = 1.0;
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          topBarOpacity = scrollController.offset / 24;
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          topBarOpacity = 0.0;
        }
      }
    });
    notifyListeners();
  }

  void getAllCourse() async {
    courseState = CourseState.loading;

    try {
      final result = await _dioService.getAllCourse();
      courseState = CourseState.none;
      courseCardModel = result;
    } catch (e) {
      courseState = CourseState.error;
    }
    notifyListeners();
  }

  final List<CourseModel> dummyList = [
    CourseModel(
      title: 'Mastering UIX Design for Industry',
      mentorName: 'Yono Salim',
      thumbnail: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
    ),
    CourseModel(
      title: 'Becoming Full Stack Web Developer',
      mentorName: 'Zeta Vestia',
      thumbnail: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
    ),
    CourseModel(
      title: 'Business Analyst untuk Membantu UMKM',
      mentorName: 'Ahok Louis',
      thumbnail: 'https://i.ibb.co/JWZs7Fq/Rectangle-5.png',
    ),
    CourseModel(
      title: 'Software Developer for Mobile Apps',
      mentorName: 'Yono Salim',
      thumbnail: 'https://i.ibb.co/QrTPxMG/Rectangle-5-3.png',
    ),
    CourseModel(
      title: 'Data Analyst from Zero to Hero',
      mentorName: 'Yono Salim',
      thumbnail: 'https://i.ibb.co/QrTPxMG/Rectangle-5-3.png',
    ),
  ];
}
