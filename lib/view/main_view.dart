import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, mainViewModel, child) {
        return Scaffold(
          // body: tabs[_currentIndex],
          body: mainViewModel.screens[mainViewModel.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainViewModel.index,
            selectedItemColor: MyColor.primary,
            selectedIconTheme: const IconThemeData(color: MyColor.primaryLogo),
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              mainViewModel.selectedDestination(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                label: 'Kursusku',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  size: 30,
                ),
                label: 'Ulasan',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: 'Profil',
              ),
            ],
          ),
          // bottomNavigationBar: NavigationBarTheme(
          //   data: NavigationBarThemeData(
          //     labelTextStyle: MaterialStateProperty.all(
          //       const TextStyle(
          //           fontSize: 14,
          //           fontWeight: FontWeight.w500,
          //           color: MyColor.primary),
          //     ),
          //   ),
          //   child: NavigationBar(
          //     height: 60,
          //     selectedIndex: mainViewModel.index,
          //     onDestinationSelected: mainViewModel.selectedDestination,
          //     // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          //     destinations: const <Widget>[
          //       NavigationDestination(
          //         icon: Icon(
          //           Icons.home,
          //           color: MyColor.primary,
          //         ),
          //         label: 'Home',
          //       ),
          //       NavigationDestination(
          //         icon: Icon(
          //           Icons.library_books,
          //           color: MyColor.primary,
          //         ),
          //         label: 'My Course',
          //       ),
          //       NavigationDestination(
          //         icon: Icon(
          //           Icons.favorite,
          //           color: MyColor.primary,
          //         ),
          //         label: 'Favorite',
          //       ),
          //       NavigationDestination(
          //         icon: Icon(
          //           Icons.person,
          //           color: MyColor.primary,
          //         ),
          //         label: 'Profile',
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
