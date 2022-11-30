import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edu_world/utils/constant.dart';

class CourseWidget extends StatefulWidget {
  const CourseWidget({super.key});

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 191,
      width: 166,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 166,
            height: 88,
            image: AssetImage("assets/images/Rectangle3.png"),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Learn Prototype untuk Penuhi Keinginan User',
            style: MyColor().judulCourse,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Agus Wahyudi',
            style: MyColor().subjudulCourse,
          ),
          const SizedBox(
            height: 7.5,
          ),
          Row(
            children: [
              Icon(
                Icons.favorite,
                size: 10,
                color: MyColor.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '(85)',
                style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: MyColor.primary,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
