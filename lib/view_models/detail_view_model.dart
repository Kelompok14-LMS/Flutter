// import 'package:edu_world/models/detail_course_model.dart';
// import 'package:flutter/material.dart';

// class DetailViewModel with ChangeNotifier {
  
//   ListDetailState courseState = ListDetailState.none;
//   List<DetailViewModel> listCourse = [];

//   void getAllCourse() async {
//     courseState = ListCourseState.loading;

//     try {
//       // final result = await _dioService.getAllCourse();
//       courseState = ListCourseState.none;
//       listCourse = dummyListCourse;
//     } catch (e) {
//       courseState = ListCourseState.error;
//     }
//     notifyListeners();
//   }

//   final List<DetailCourseModel> detailCourse = [
//     DetailCourseModel(
//       image: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
//       title: 'Mastering UIX Design for Industry',
//       description: 'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
//       favorite: '(65)',
//       author: 'Yono Salim',
//     ),
//     DetailCourseModel(
//       image: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
//       title: 'Becoming Full Stack Web Developer',
//       description: 'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
//       favorite: '(65)',
//       author: 'Yono Salim',
//     )
//   ];

// }
