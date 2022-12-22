// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edu_world/view/home/components/grid_course_shimmer.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:edu_world/view/list_course/components/course/kelas_course_home.dart';
import 'package:edu_world/view_models/couse_view_model.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
  final String category;
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    final courseClassViewModel = Provider.of<CourseViewModel>(context);
    final dataMentee = Provider.of<EnrollViewModel>(context);
    final courseState = courseClassViewModel.courseState;
    return courseState == CourseState.loading
        ? const Expanded(child: GridCourseShimmer())
        : courseState == CourseState.error
            ? const Expanded(
                child: Center(child: Text('Error Load Data')),
              )
            : Expanded(
                child: GridView.builder(
                  itemCount: widget.category == "UI/UX"
                      ? courseClassViewModel.uiUx.length
                      : widget.category == "Front End"
                          ? courseClassViewModel.frontEnd.length
                          : courseClassViewModel.backEnd.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.9,
                    mainAxisExtent: 224,
                  ),
                  itemBuilder: (context, index) {
                    return dataMentee.mentee != null
                        ? KelasCourse(
                            mentee: dataMentee.mentee!,
                            height: 104,
                            fontSize: 16,
                            courseModel: widget.category == "UI/UX"
                                ? courseClassViewModel.uiUx[index]
                                : widget.category == "Front End"
                                    ? courseClassViewModel.frontEnd[index]
                                    : courseClassViewModel.backEnd[index],
                          )
                        : const CircularProgressIndicator();
                  },
                ),
              );
  }
}
