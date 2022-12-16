import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/on_boarding.dart';

class OnBoardingViewModel extends ChangeNotifier {
  int? _saveIsViewed;
  int? get saveIsViewed => _saveIsViewed;

  final List<OnBoarding> _pageOnBoarding = [
    OnBoarding(
      image: 'assets/onboarding/pict_1.svg',
      desc: '''Hello! 
Ayo Mulai Belajar Bersama ''',
      diffDesc: 'EduWorld',
    ),
    OnBoarding(
      image: 'assets/onboarding/pict_2.svg',
      desc: '''Ribuan Mentor Siap
Membantumu
Meraih ''',
      diffDesc: 'Cita-cita',
    ),
    OnBoarding(
      image: 'assets/onboarding/pict_3.svg',
      desc: '''Akses Semua Kelas 
secara ''',
      diffDesc: 'Gratis',
    ),
  ];

  List<OnBoarding> get pageOnBoarding => _pageOnBoarding;

  Future<void> setOnBoarding() async {
    int isViewed = 0;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('onBoard', isViewed);
    notifyListeners();
  }

  Future<void> getOnBoarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _saveIsViewed = pref.getInt('onBoard');
    notifyListeners();
  }
}
