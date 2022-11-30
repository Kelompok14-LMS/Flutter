import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KelasCourse extends StatefulWidget {
  const KelasCourse({super.key});

  @override
  State<KelasCourse> createState() => _KelasCourseState();
}

class _KelasCourseState extends State<KelasCourse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),

          //1
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: 166,
                height: 88,
                image: AssetImage("assets/images/Rectangle3.png"),
              ),
              const SizedBox(height: 8,),
              Text('Learn Prototype untuk Penuhi Keinginan User', style: MyColor().judulCourse,),
              const SizedBox(height: 14,),
              Text('Agus Wahyudi', style: MyColor().subjudulCourse,),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.favorite, size: 10, color: MyColor.primary,),
                  const SizedBox(width: 5,),
                  Text('(85)', style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: MyColor.primary,
                    fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
