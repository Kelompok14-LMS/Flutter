import 'package:edu_world/services/course_service.dart';
import 'package:flutter/material.dart';

import '../models/course_card_model.dart';

enum CourseState { none, loading, error }

class CourseViewModel with ChangeNotifier {
  final _dioService = CourseDioService();
  final ScrollController scrollController = ScrollController();
  late double topBarOpacity = 0.0;
  CourseState courseState = CourseState.none;
  List<CourseCardModel> courseCardModel = [];

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

  final List<CourseCardModel> dummyList = [
    CourseCardModel(
      title: 'Mastering UIX Design for Industry',
      mentor: 'Yono Salim',
      thumbnail: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
    ),
    CourseCardModel(
      title: 'Becoming Full Stack Web Developer',
      mentor: 'Zeta Vestia',
      thumbnail: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
    ),
    CourseCardModel(
      title: 'Business Analyst untuk Membantu UMKM',
      mentor: 'Ahok Louis',
      thumbnail: 'https://i.ibb.co/JWZs7Fq/Rectangle-5.png',
    ),
    CourseCardModel(
      title: 'Software Developer for Mobile Apps',
      mentor: 'Yono Salim',
      thumbnail: 'https://i.ibb.co/QrTPxMG/Rectangle-5-3.png',
    ),
    CourseCardModel(
      title: 'Data Analyst from Zero to Hero',
      mentor: 'Yono Salim',
      thumbnail: 'https://i.ibb.co/QrTPxMG/Rectangle-5-3.png',
    ),
  ];
}
