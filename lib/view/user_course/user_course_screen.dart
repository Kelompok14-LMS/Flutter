import 'package:edu_world/view/user_course/components/custom_tab_bar.dart';
import 'package:edu_world/view/user_course/components/search_bar.dart';
import 'package:edu_world/view/user_course/components/user_list_course.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String mentee2 = '';

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SearchBarUserCourse(titleSearch: 'Cari di Kursusku'),
            CustomTabBar(
              tabController: tabController,
              mentee: mentee2,
            ),
            Expanded(
              child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: UserListCourse(
                      status: 'ongoing',
                      isOngoing: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: UserListCourse(
                      status: 'completed',
                      isOngoing: false,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
