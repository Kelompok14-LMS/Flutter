import 'package:edu_world/view/detail_course/preview_course/detail_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';

class KelasCourse extends StatefulWidget {
  const KelasCourse({
    Key? key,
    required this.courseModel,
    required this.fontSize,
    required this.height,
    required this.mentee,
  }) : super(key: key);
  final CourseModel courseModel;
  final double fontSize;
  final double height;
  final String mentee;

  @override
  State<KelasCourse> createState() => _KelasCourseState();
}

class _KelasCourseState extends State<KelasCourse> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<EnrollViewModel>(context);

    return SizedBox(
      height: 196,
      width: 160,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: () async {
            await Provider.of<EnrollViewModel>(context, listen: false)
                .checkEnrollmentCourse(widget.courseModel.id!, widget.mentee);
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => PreviewCourseScreen(
                        mentee: widget.mentee,
                        courseModel: widget.courseModel,
                      )),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: double.maxFinite,
                height: widget.height,
                image: NetworkImage(widget.courseModel.thumbnail!),
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.courseModel.title!,
                      style: GoogleFonts.roboto(
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w700,
                          color: MyColor.primary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.courseModel.mentorName!,
                      style: GoogleFonts.roboto(
                          fontSize: widget.fontSize - 2,
                          fontWeight: FontWeight.w400,
                          color: MyColor.primary),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
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
                              fontSize: widget.fontSize - 2,
                              color: MyColor.primary,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          ('(${widget.courseModel.totalReviews!.toString()})'),
                          style: GoogleFonts.roboto(
                              fontSize: widget.fontSize - 2,
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
        ),
      ),
    );
  }
}
