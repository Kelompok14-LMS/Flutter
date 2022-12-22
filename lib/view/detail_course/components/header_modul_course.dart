// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/skeleton.dart';
import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:flutter/material.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HeaderModulCourse extends StatelessWidget {
  const HeaderModulCourse({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(courseModel.thumbnail!), fit: BoxFit.cover),
          ),
          height: 166,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      courseModel.title!,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff112D4E),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'by ',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff112D4E),
                        ),
                      ),
                      Text(
                        courseModel.mentorName!,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff112D4E),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                ],
              ),
              Consumer<MaterialsViewModel>(builder: (context, data, _) {
                if (data.courseMaterialsState == CourseMaterialsState.loading) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade500,
                      loop: 3,
                      child: const Skeleton(height: 50, width: 50));
                }
                if (data.courseMaterialsState == CourseMaterialsState.error) {
                  return const Text('Error');
                } else {
                  if (data.modulsEnrolled.progress == null) {
                    return const CircularProgressIndicator();
                  } else {
                    final percent = (data.modulsEnrolled.progress! /
                        data.modulsEnrolled.totalMaterials!);
                    return CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 8.0,
                      percent: percent.isNaN
                          ? 0.0
                          : percent <= 1
                              ? percent
                              : 1,
                      animation: true,
                      animationDuration: 1000,
                      center: Text(
                        percent.isNaN
                            ? "${(0.0 * 100)}%"
                            : "${((percent <= 1 ? percent : 1) * 100).toInt()}%",
                        style: const TextStyle(color: MyColor.primary),
                      ),
                      progressColor: MyColor.primaryLogo,
                      circularStrokeCap: CircularStrokeCap.round,
                    );
                  }
                }
              }),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            courseModel.description!,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xff112D4E),
              height: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
