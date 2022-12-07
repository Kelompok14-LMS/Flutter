import 'package:flutter/material.dart';

import '../models/course_model.dart';

enum ListCourseState { none, loading, error }

class CourseClassViewModel with ChangeNotifier {
  ListCourseState courseState = ListCourseState.none;

  List<CourseModel> listCourse = [];

  void getAllCourse() async {
    courseState = ListCourseState.loading;

    try {
      // final result = await _dioService.getAllCourse();
      courseState = ListCourseState.none;
      listCourse = dummyListCourseClass;
    } catch (e) {
      courseState = ListCourseState.error;
    }
    notifyListeners();
  }

  List<CourseModel> dummyListCourseClass = [
    CourseModel(
        title: 'Learn Prototype untuk Penuhi keinginan User',
        thumbnail: 'https://i.ibb.co/9rn1t1b/Rectangle-3.png',
        mentorName: 'Agus Wahyudi',
        category: 'UI/UX'),
    CourseModel(
        title: 'Data Analyst from Zero to Hero',
        thumbnail: 'https://i.ibb.co/48V8NHy/Rectangle-3-1.png',
        mentorName: 'Supri Septiadi',
        category: 'Data Science'),
    CourseModel(
      title: 'Business Analyst untuk membantu UMKM',
      thumbnail: 'https://i.ibb.co/48V8NHy/Rectangle-3-1.png',
      mentorName: 'Wiro',
      category: 'Data Analyst',
    ),
  ];
}
