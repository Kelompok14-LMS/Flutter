import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/main_view.dart';
import 'package:edu_world/view_models/favorite_view_model.dart';
import 'package:edu_world/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_models/couse_view_model.dart';
import 'view_models/profile_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CourseViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edu World',
        theme: ThemeData(
          primarySwatch: MyColor.primarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
