import 'package:edu_world/view/components/search_bar.dart';
import 'package:edu_world/view/list_course/list_course.dart';
import 'package:edu_world/view/list_course/widget/course/kelas_course_home.dart';
import 'package:edu_world/view/list_course/widget/rekomendasi/design.dart';
import 'package:edu_world/view/recommendation/recommendation_view.dart';
import 'package:edu_world/view_models/course_class_view_model.dart';
import 'package:edu_world/view_models/list_course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constant.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final listCourseViewModel = Provider.of<ListCourseViewModel>(context);
    final courseClassViewModel = Provider.of<CourseClassViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            const SearchBar(titleSearch: 'Cari Kursus'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    SizedBox(
                      height: size.height / 23.15,
                      child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: MyColor.primaryLogo, width: 1),
                          backgroundColor: MyColor.primaryLogo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Semua Topik',
                          style: TextStyle(color: MyColor.primary),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      height: size.height / 23.15,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              color: MyColor.primary, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'UI/UX',
                          style: TextStyle(color: MyColor.primary),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      height: size.height / 23.15,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              color: MyColor.primary, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Front End',
                          style: TextStyle(color: MyColor.primary),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      height: size.height / 23.15,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              color: MyColor.primary, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Back End',
                          style: TextStyle(color: MyColor.primary),
                        ),
                      ),
                    ),
                  ],
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
                      child: Text('Lihat Semua',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: const Color(0xff0848AF))),
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
                      courseClassViewModel.dummyListCourseClass.length,
                      (index) {
                    return SizedBox(
                      height: 196,
                      width: 160,
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: KelasCourse(
                          courseModel:
                              courseClassViewModel.dummyListCourseClass[index],
                        ),
                      ),
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
                      'Rekomendasi',
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
              child: ListView.builder(
                itemCount: listCourseViewModel.dummyListCourse.length,
                itemBuilder: (context, index) {
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
                          // onTap: () {
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => DetailCourseScreen(
                          //         courseModel: listCourseViewModel
                          //             .dummyListCourse[index]),
                          //   ));
                          // },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            // Column(
            //   children: List.generate(
            //       listCourseViewModel.dummyListCourse.length, (index) {
            //     return
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}
