import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/list_course/components/course/kelas_course_home.dart';

import '../../view_models/couse_view_model.dart';

class Course extends StatefulWidget {
  const Course({
    Key? key,
    required this.mentee,
  }) : super(key: key);
  final String mentee;

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    final courseClassViewModel = Provider.of<CourseViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Daftar Kursus',
          style: MyColor().appTextsStyle,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColor.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: GridView.builder(
                  itemCount: courseClassViewModel.allCourse.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.9,
                    mainAxisExtent: 224,
                  ),
                  itemBuilder: (context, index) {
                    return KelasCourse(
                      courseModel: courseClassViewModel.allCourse[index],
                      fontSize: 16,
                      height: 104,
                      mentee: widget.mentee,
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
