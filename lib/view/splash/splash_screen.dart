import 'dart:async';
import 'package:edu_world/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_models/onboarding_view_model.dart';
import '../login/login_screen.dart';
import '../on_boarding/on_boarding_sceen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.asset('assets/splash/logo_splash.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      final isViewed = context.read<OnBoardingViewModel>().saveIsViewed;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              isViewed != 0 ? const OnboardingScreen() : const LoginScreen(),
        ),
      );
      checkLogin();
    });
  }

  void checkLogin() async {
    final helper = await SharedPreferences.getInstance();
    final token = helper.getString('token');
    if (token != null) {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
            (route) => false);
      }
    }
    return null;
  }
}
