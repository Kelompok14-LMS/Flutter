import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/splash/splash_screen.dart';
import 'package:edu_world/view_models/auth_view_model.dart';
import 'package:edu_world/view_models/certificate_view_model.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/main_view_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:edu_world/view_models/onboarding_view_model.dart';
import 'package:edu_world/view_models/popular_view_modal.dart';
import 'package:edu_world/view_models/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/assignment_view_model.dart';
import 'view_models/couse_view_model.dart';
import 'view_models/profile_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
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
      create: (context) => AuthViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => OnBoardingViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => PopularViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AssignmentViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => MaterialsViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => EnrollViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ReviewCourseViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => CertificateViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OnBoardingViewModel>().getOnBoarding();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edu World',
        theme: ThemeData(
          primarySwatch: MyColor.primarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
        ),
        home: const SplashScreen());
  }
}
