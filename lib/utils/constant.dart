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
// Color secondary = const Color.fromARGB(255, 1, 145, 193);
// Color transparent = Colors.transparent;
// Color black = Colors.black;
// Color grey = Colors.grey;
// Color red = Colors.red;
// Color green = Colors.green;
// Color shadow = Colors.grey.shade400;
// Color textGrey1 = Colors.grey.shade500;
// Color star = Colors.yellow.shade600;

static const Color blackBase = Color(0xff222222);
static const Color whiteColor = Colors.white;
static const Color blackColor = Colors.black;
static const Color blackLight = Color(0xff3F3F3F);

// font black
TextStyle blackTextsStyle = GoogleFonts.roboto(
  fontSize: 22,
  color: blackBase,
);
//font white
TextStyle whiteTextStyle = GoogleFonts.roboto(
  fontSize: 14,
  color: whiteColor,
);
//font judulcourse
TextStyle judulCourse = GoogleFonts.roboto(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: blackBase
);
//font subjudul
TextStyle subjudulCourse = GoogleFonts.roboto(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: blackLight
);
// font appbar
TextStyle appTextsStyle = GoogleFonts.roboto(
  fontSize: 22,
  color: primary,
);
}
