import 'package:flutter/material.dart';

import '../models/course_card_model.dart';

class CourseViewModel with ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  late double topBarOpacity = 0.0;

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

  final List<CourseCardModel> dummyList = [
    CourseCardModel(
      header: 'Mastering UIX Design for Industry',
      author: 'Yono Salim',
      images: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
    ),
    CourseCardModel(
      header: 'Becoming Full Stack Web Developer',
      author: 'Zeta Vestia',
      images: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
    ),
    CourseCardModel(
      header: 'Business Analyst untuk Membantu UMKM',
      author: 'Ahok Louis',
      images: 'https://i.ibb.co/JWZs7Fq/Rectangle-5.png',
    ),
    CourseCardModel(
      header: 'Software Developer for Mobile Apps',
      author: 'Yono Salim',
      images: 'https://i.ibb.co/QrTPxMG/Rectangle-5-3.png',
    ),
    CourseCardModel(
      header: 'Data Analyst from Zero to Hero',
      author: 'Yono Salim',
      images: 'https://i.ibb.co/QrTPxMG/Rectangle-5-3.png',
    ),
  ];
}
