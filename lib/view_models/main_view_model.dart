import 'package:flutter/material.dart';

import '../view/course/course_screen.dart';
import '../view/favorite/favorite_screen.dart';
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
    const Center(
      child: Text('HOME'),
    ),
    const CourseScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  /// End Navbar
}
