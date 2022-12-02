// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/utils/constant.dart';

class KelasCourse extends StatefulWidget {
  const KelasCourse({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  final CourseModel courseModel;

  @override
  State<KelasCourse> createState() => _KelasCourseState();
}

class _KelasCourseState extends State<KelasCourse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 166,
            height: 88,
            image: NetworkImage(widget.courseModel.thumbnail!),
          ),
          // const SizedBox(
          //   height: 8,
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.courseModel.title!,
                  style: MyColor().judulCourse,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  widget.courseModel.mentorName!,
                  style: MyColor().subjudulCourse,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
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
          )
        ],
      ),
    );
  }
}
