import 'package:edu_world/view/components/search_bar.dart';
import 'package:edu_world/view/home/components/custom_tab_bar_button.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/popular_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? mentee;
  @override
  void initState() {
    checkLogin();
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    Provider.of<PopularViewModel>(context, listen: false).getPopularCourse();
    super.initState();
  }

  void checkLogin() async {
    final share = await SharedPreferences.getInstance();
    final token = share.getString('token');
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    mentee = (payload['mentee_id']);
    if (!mounted) return;
    Provider.of<EnrollViewModel>(context, listen: false).saveMenteeId(mentee!);
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
