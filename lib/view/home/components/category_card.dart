// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:edu_world/view/list_course/widget/course/kelas_course_home.dart';
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
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false)
        .getCoursebyCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final courseClassViewModel = Provider.of<CourseViewModel>(context);

    return Expanded(
      child: GridView.builder(
        itemCount: courseClassViewModel.uiux.length,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.9,
          mainAxisExtent: 224,
        ),
        itemBuilder: (context, index) {
          return KelasCourse(
              height: 104,
              fontSize: 16,
              courseModel: courseClassViewModel.uiux[index]);
        },
      ),
      // child: GridView.count(
      //   crossAxisCount: 2,
      //   children: List.generate(
      //       courseClassViewModel.uiux.length,
      //       (index) => KelasCourse(
      //           courseModel: courseClassViewModel.uiux[index])),
      // ),
    );
  }
}
