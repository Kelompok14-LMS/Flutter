import 'package:edu_world/view/components/search_bar.dart';
import 'package:edu_world/view/home/components/custom_tab_bar_button.dart';
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