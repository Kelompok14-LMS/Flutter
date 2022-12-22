import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColor {
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF112D4E, <int, Color>{
    50: Color(0xFFE2E6EA),
    100: Color(0xFFB8C0CA),
    200: Color(0xFF8896A7),
    300: Color(0xFF586C83),
    400: Color(0xFF354D69),
    500: Color(0xFF112D4E),
    600: Color(0xFF0F2847),
    700: Color(0xFF0C223D),
    800: Color(0xFF0A1C35),
    900: Color(0xFF051125),
  });

  static const Color primary = Color(0xff112D4E);
  static const Color danger = Color(0xff961041);
  static const Color info = Color(0xff0848AF);
  static const Color primaryLogo = Color(0xFFE4B548);
  static const Color review = Color(0xFFB0B9C4);
  static const Color blackBase = Color(0xff222222);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color blackLight = Color(0xff3F3F3F);

// font black
  TextStyle blackTextsStyle = GoogleFonts.roboto(
    fontSize: 22,
    color: blackBase,
  );
  TextStyle primaryTextStyle = GoogleFonts.roboto(
    fontSize: 22,
    color: primary,
  );
//font white
  TextStyle whiteTextStyle = GoogleFonts.roboto(
    fontSize: 14,
    color: whiteColor,
  );
//font onBoarding
  TextStyle fontOnBoarding = GoogleFonts.roboto(
      fontSize: 32, fontWeight: FontWeight.w700, color: primary);
//font onBoardingDiff
  TextStyle fontOnBoardingDiff = GoogleFonts.roboto(
      fontSize: 32, fontWeight: FontWeight.w700, color: primaryLogo);
//font judulcourse
  TextStyle judulCourse = GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, color: primary);
//font subjudul
  TextStyle subjudulCourse = GoogleFonts.roboto(
      fontSize: 12, fontWeight: FontWeight.w400, color: primary);
//font loginField
  TextStyle loginField = GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.w700, color: primary);
// font hintTextField
  TextStyle hintTextField =
      GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400);
// font EmptyCourse
  TextStyle emptyCourseTextStyle = GoogleFonts.roboto(
      fontSize: 24, fontWeight: FontWeight.w700, color: primary);
// font EmptyCourseSpan
  TextStyle emptyCourseTextStyleSpan = GoogleFonts.roboto(
      fontSize: 24, fontWeight: FontWeight.w700, color: primaryLogo);
// font tabBar
  TextStyle tabBarTextStyle = GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w700, color: primary);
// font reviewCourseText
  TextStyle reviewCourseTextStyle = GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w700, color: primary);
// font reviewCourseTextRating
  TextStyle reviewCourseSubTextStyleRating = GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w400, color: primary);
// font reviewCourseSubText
  TextStyle reviewCourseSubTextStyle = GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w400, color: primary);
// font appbar
  TextStyle appTextsStyle = GoogleFonts.roboto(
    fontSize: 22,
    color: primary,
  );
}
