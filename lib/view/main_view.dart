import 'package:edu_world/constant.dart';
import 'package:edu_world/view/course/course_screen.dart';
import 'package:edu_world/view/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  List<Widget> screens = [
    // HomeScreen(),
    const Center(
      child: Text('HOME'),
    ),
    const CourseScreen(),
    const FavoriteScreen(),
    const Center(
      child: Text('PROFILE'),
    ),
    // FavoriteScreen(),
    // ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: primary),
          ),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() => index = value),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: primary,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.library_books,
                color: primary,
              ),
              label: 'My Course',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.favorite,
                color: primary,
              ),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
                color: primary,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
