import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edu_world/utils/constant.dart';

class KelasCourseAndro extends StatefulWidget {
  const KelasCourseAndro({super.key});

  @override
  State<KelasCourseAndro> createState() => _KelasCourseAndroState();
}

class _KelasCourseAndroState extends State<KelasCourseAndro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: 166,
                height: 88,
                image: AssetImage("assets/images/Rectangle4.png"),
              ),
              const SizedBox(height: 8,),
              Text('Data Analyst From Zero to Hero', style: MyColor().judulCourse,),
              const SizedBox(height: 14,),
              Text('Supri Septiadi', style: MyColor().subjudulCourse,),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.favorite, size: 10, color: MyColor.primary,),
                  const SizedBox(width: 5,),
                  Text('(115)', style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: MyColor.primary,
                    fontWeight: FontWeight.w400
                  ),)
                ],
              ),
            ],
          ),
        ),
      );
  }
}
