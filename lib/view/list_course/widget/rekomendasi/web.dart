import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Web extends StatefulWidget {
  const Web({super.key});

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          //1
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: 60,
                height: 60,
                image: AssetImage("assets/images/Rectangle6.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Business Analyst untuk Membantu UMKM',
                    style: MyColor().judulCourse,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'Wiro',
                        style: MyColor().subjudulCourse,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.favorite,
                        size: 10,
                        color: MyColor.primary,
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
            ],
          ),
        ),
      ),
    );
  }
}
