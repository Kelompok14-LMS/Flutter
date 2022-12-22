import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/skeleton.dart';
import 'package:edu_world/view/detail_course/preview_course/detail_course_screen.dart';
import 'package:edu_world/view/list_course/list_course.dart';
import 'package:edu_world/view/list_course/components/course/kelas_course_home.dart';
import 'package:edu_world/view/list_course/components/rekomendasi/design.dart';
import 'package:edu_world/view/recommendation/recommendation_view.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/popular_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeCourse extends StatefulWidget {
  const HomeCourse({
    Key? key,
    required this.courseClassViewModel,
  }) : super(key: key);

  final CourseViewModel courseClassViewModel;

  @override
  State<HomeCourse> createState() => _HomeCourseState();
}

class _HomeCourseState extends State<HomeCourse> {
  @override
  Widget build(BuildContext context) {
    final popularCourse = Provider.of<PopularViewModel>(context);
    final dataProvider = Provider.of<EnrollViewModel>(context);

    return Expanded(
      child: SingleChildScrollView(
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
                            builder: (context) => Course(
                              mentee: dataProvider.mentee!,
                            ),
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
                      widget.courseClassViewModel.allCourse.length <= 3
                          ? widget.courseClassViewModel.allCourse.length
                          : 3, (index) {
                    return dataProvider.mentee != null
                        ? KelasCourse(
                            height: 90,
                            fontSize: 14,
                            courseModel:
                                widget.courseClassViewModel.allCourse[index],
                            mentee: dataProvider.mentee!,
                          )
                        : Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade500,
                            loop: 3,
                            child: Row(
                              children: const [
                                Skeleton(
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                          );
                  }),
                ),
              ),
            ),
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
                            builder: (context) => Rekomendasi(
                              mentee: dataProvider.mentee!,
                            ),
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
              height: 20,
            ),
            Column(
              children: List.generate(
                popularCourse.popularCourse.length <= 5
                    ? popularCourse.popularCourse.length
                    : 5,
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
                            courseModel: popularCourse.popularCourse[index],
                          ),
                          onTap: () async {
                            await Provider.of<EnrollViewModel>(context,
                                    listen: false)
                                .checkEnrollmentCourse(
                                    popularCourse.popularCourse[index].id!,
                                    dataProvider.mentee!);
                            if (!mounted) return;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => PreviewCourseScreen(
                                        courseModel:
                                            popularCourse.popularCourse[index],
                                        mentee: dataProvider.mentee!,
                                      )),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
