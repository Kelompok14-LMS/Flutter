import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/detail_course/detail_course_screen.dart';
import 'package:edu_world/view/list_course/list_course.dart';
import 'package:edu_world/view/list_course/widget/course/kelas_course_home.dart';
import 'package:edu_world/view/list_course/widget/rekomendasi/design.dart';
import 'package:edu_world/view/recommendation/recommendation_view.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:edu_world/view_models/list_course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCourse extends StatelessWidget {
  const HomeCourse({
    Key? key,
    required this.courseClassViewModel,
    required this.listCourseViewModel,
  }) : super(key: key);

  final CourseViewModel courseClassViewModel;
  final ListCourseViewModel listCourseViewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daftar Kursus',
                    style: MyColor()
                        .primaryTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Course(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Lihat Semua',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: const Color(0xff0848AF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: List.generate(
                    courseClassViewModel.allCourse.length <= 3
                        ? courseClassViewModel.allCourse.length
                        : 3, (index) {
                  return KelasCourse(
                    height: 90,
                    fontSize: 14,
                    courseModel: courseClassViewModel.allCourse[index],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kursus Populer',
                    style: MyColor()
                        .primaryTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Rekomendasi(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Lihat Semua',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: const Color(0xff0848AF)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  listCourseViewModel.dummyListCourse.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        height: 80,
                        width: 380,
                        child: Card(
                          // semanticCo ntainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            child: Design(
                              courseModel:
                                  listCourseViewModel.dummyListCourse[index],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailCourseScreen(
                                      courseModel: listCourseViewModel
                                          .dummyListCourse[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
