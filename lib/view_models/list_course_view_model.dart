import 'package:flutter/material.dart';

import '../models/course_model.dart';

enum ListCourseState { none, loading, error }

class ListCourseViewModel with ChangeNotifier {
  // final _dioService = CourseDioService();

  ListCourseState courseState = ListCourseState.none;
  List<CourseModel> listCourse = [];

  void getAllCourse() async {
    courseState = ListCourseState.loading;

    try {
      // final result = await _dioService.getAllCourse();
      courseState = ListCourseState.none;
      listCourse = dummyListCourse;
    } catch (e) {
      courseState = ListCourseState.error;
    }
    notifyListeners();
  }

  List<CourseModel> dummyListCourse = [
    CourseModel(
      title: 'Mastering UIX Design for Industry',
      thumbnail: 'https://i.ibb.co/dBTKRf2/Rectangle5.png',
      mentorName: 'Yono Salim',
    ),
    CourseModel(
      title: 'Becoming fullstack Web Developer',
      thumbnail: 'https://i.ibb.co/wYTGr3G/Rectangle6.png',
      mentorName: 'Zeta Vestia',
    ),
    CourseModel(
      title: 'Business Analyst untuk membantu UMKM',
      thumbnail: 'https://i.ibb.co/ckwvph2/Rectangle7.png',
      mentorName: 'Ahok Louis',
    ),
    CourseModel(
      title: 'Software Developer for Mobile Apps',
      thumbnail: 'https://i.ibb.co/rZStPr5/Rectangle-4.png',
      mentorName: 'Yono Salim',
    ),
    CourseModel(
      title: 'Mastering UIX Design for Industry',
      thumbnail: 'https://i.ibb.co/TY4Hn72/photo5.png',
      mentorName: 'Yono Salim',
    ),
  ];
}
