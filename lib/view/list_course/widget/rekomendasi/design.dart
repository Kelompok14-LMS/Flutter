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
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: 100,
          height: 80,
          image: NetworkImage(
            widget.courseModel.thumbnail!,
          ),
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              width: size.width / 1.8,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.courseModel.title!,
                      style: MyColor().judulCourse,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
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
                  width: 12,
                ),
                const Icon(
                  Icons.star,
                  size: 16,
                  color: MyColor.primaryLogo,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.courseModel.rating!.toStringAsFixed(1),
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: MyColor.primary,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  ('(${widget.courseModel.totalReviews!.toString()})'),
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: const Color(0xFF8896A6),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
