import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RobotoText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final Color? color;

  const RobotoText({
    super.key,
    this.textAlign,
    this.lineHeight,
    this.fontWeight,
    this.color,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        height: lineHeight,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
