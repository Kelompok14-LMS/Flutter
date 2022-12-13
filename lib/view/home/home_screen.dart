import 'package:edu_world/view/components/search_bar.dart';
import 'package:edu_world/view/home/components/custom_tab_bar_button.dart';
import 'package:edu_world/view/detail_course/detail_course_screen.dart';
import 'package:edu_world/view/detail_course/detail_course_screen_revisi.dart';
import 'package:edu_world/view/list_course/list_course.dart';
import 'package:edu_world/view/list_course/widget/course/kelas_course_home.dart';
import 'package:edu_world/view/list_course/widget/rekomendasi/design.dart';
import 'package:edu_world/view/recommendation/recommendation_view.dart';
import 'package:edu_world/view_models/course_class_view_model.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: const [
            SearchBar(titleSearch: 'Cari Kursus'),
            CustomTabBarButton(),
          ],
        ),
      ),
    );
  }
}
