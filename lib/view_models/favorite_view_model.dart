import 'package:flutter/material.dart';

import '../models/course_card_model.dart';

class FavoriteViewModel with ChangeNotifier {
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
  ];
}
