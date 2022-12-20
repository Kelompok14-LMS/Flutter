import 'package:edu_world/view/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../view/user_course/user_course_screen.dart';
import '../view/review/review_screen.dart';
import '../view/profile/profile_screen.dart';

class MainViewModel with ChangeNotifier {
  /// NavBar
  int index = 0;
  void selectedDestination(int value) {
    index = value;
    notifyListeners();
  }

  List<Widget> screens = [
    //const HomeScreen(),
    const HomeScreen(),
    const CourseScreen(),
    const ReviewScreen(),
    const ProfileScreen()
  ];

  /// End Navbar
}
