import 'package:edu_world/view/list_course/list_course.dart';
import 'package:edu_world/view/list_course/widget/course/kelas_course1_home.dart';
import 'package:edu_world/view/list_course/widget/course/kelas_course_home.dart';
import 'package:edu_world/view/list_course/widget/rekomendasi/design.dart';
import 'package:edu_world/view/recommendation/recommendation_view.dart';
import 'package:edu_world/view_models/list_course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constant.dart';
import '../list_course/widget/course/kelas_course2_home.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: MyColor.primary,
                    hintText: 'Cari Course',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.primary),
                        onPressed: () {},
                        child: const Text('Semua Topik'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.primary),
                        onPressed: () {},
                        child: const Text('UI/UX'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.primary),
                        onPressed: () {},
                        child: const Text('Front End'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.primary),
                        onPressed: () {},
                        child: const Text('Back End'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kelas Course',
                      style: MyColor()
                          .blackTextsStyle
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
                      child: Text('Lihat Semua',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: const Color(0xff0848AF))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 166,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: const KelasCourse()),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      SizedBox(
                          height: 200,
                          width: 166,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: const KelasCourseAndro())),
                      const SizedBox(
                        width: 24,
                      ),
                      SizedBox(
                          height: 200,
                          width: 166,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: const KelasCourseUMKM()))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rekomendasi',
                      style: MyColor()
                          .blackTextsStyle
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
              const SizedBox(
                height: 5,
              ),
              Column(
                children: List.generate(
                    listCourseViewModel.dummyListCourse.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Design(
                          courseModel:
                              listCourseViewModel.dummyListCourse[index],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
