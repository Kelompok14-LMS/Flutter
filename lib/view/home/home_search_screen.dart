import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/detail_course/preview_course/detail_course_screen.dart';
import 'package:edu_world/view/list_course/components/rekomendasi/design.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSearchScreen extends StatelessWidget {
  HomeSearchScreen({super.key});

  TextEditingController keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataProv = Provider.of<EnrollViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: MyColor.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        autocorrect: false,
                        controller: keywordController,
                        autofocus: true,
                        onChanged: (value) {
                          Provider.of<CourseViewModel>(context, listen: false)
                              .getAllCourseByKeyword(keywordController.text);
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          filled: false,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: 'Cari Kursus',
                          hintStyle: const TextStyle(
                            color: MyColor.primary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.3), width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 0.8,
                      blurRadius: 10,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ]),
            ),
            Consumer<CourseViewModel>(
              builder: (context, value, child) {
                return value.keywordCourse.isNotEmpty
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: List.generate(
                                value.keywordCourse.length <= 10
                                    ? value.keywordCourse.length
                                    : 10,
                                (index) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: SizedBox(
                                          height: 80,
                                          width: 380,
                                          child: Card(
                                            // semanticCo ntainer: true,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: InkWell(
                                              child: Design(
                                                courseModel:
                                                    value.keywordCourse[index],
                                              ),
                                              onTap: () async {
                                                await Provider.of<
                                                            EnrollViewModel>(
                                                        context,
                                                        listen: false)
                                                    .checkEnrollmentCourse(
                                                        value
                                                            .keywordCourse[
                                                                index]
                                                            .id!,
                                                        dataProv.mentee!);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PreviewCourseScreen(
                                                            mentee: dataProv
                                                                .mentee!,
                                                            courseModel: value
                                                                    .keywordCourse[
                                                                index],
                                                          )),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Expanded(
                        child: Center(child: Text('Belum ada Kursus')));
              },
            )
          ],
        ),
      ),
    );
  }
}
