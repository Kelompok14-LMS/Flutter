import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
              ))),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
