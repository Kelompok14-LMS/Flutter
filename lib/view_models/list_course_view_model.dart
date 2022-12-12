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
      thumbnail: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
      description:
          "Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.",
      mentorName: 'Yono Salim',
    ),
    CourseModel(
      title: 'Becoming fullstack Web Developer',
      thumbnail: 'https://i.ibb.co/wYTGr3G/Rectangle6.png',
      description:
          "Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.",
      mentorName: 'Zeta Vestia',
    ),
    CourseModel(
      title: 'Business Analyst untuk membantu UMKM',
      thumbnail: 'https://i.ibb.co/ckwvph2/Rectangle7.png',
      description:
          "Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.",
      mentorName: 'Ahok Louis',
    ),
    CourseModel(
      title: 'Software Developer for Mobile Apps',
      thumbnail: 'https://i.ibb.co/rZStPr5/Rectangle-4.png',
      description:
          "Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.",
      mentorName: 'Yono Salim',
    ),
    CourseModel(
      title: 'Mastering UIX Design for Industry',
      thumbnail: 'https://i.ibb.co/TY4Hn72/photo5.png',
      description:
          "Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.",
      mentorName: 'Yono Salim',
    ),
  ];
}
