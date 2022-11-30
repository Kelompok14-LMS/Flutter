import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KelasCourseUMKM extends StatefulWidget {
  const KelasCourseUMKM({super.key});

  @override
  State<KelasCourseUMKM> createState() => _KelasCourseUMKMState();
}

class _KelasCourseUMKMState extends State<KelasCourseUMKM> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 191,
          width: 166,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          //1
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: 166,
                height: 88,
                image: AssetImage("assets/images/Rectangle4.png"),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Business Analyst untuk Membantu UMKM',
                style: MyColor().judulCourse,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Wiro',
                style: MyColor().subjudulCourse,
              ),
              const SizedBox(
                height: 5,
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
                    '(100)',
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: MyColor.primary,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
