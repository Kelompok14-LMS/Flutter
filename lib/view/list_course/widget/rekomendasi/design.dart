// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/utils/constant.dart';

class Design extends StatefulWidget {
  const Design({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  final CourseModel courseModel;

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        //1
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image(
                width: 50,
                height: double.maxFinite,
                image: NetworkImage(
                  widget.courseModel.thumbnail!,
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.courseModel.title!,
                  style: MyColor().judulCourse,
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      widget.courseModel.mentorName!,
                      style: MyColor().subjudulCourse,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
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
    );
  }
}
