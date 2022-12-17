import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/list_course/widget/course/kelas_course_home.dart';
import 'package:edu_world/view_models/popular_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rekomendasi extends StatefulWidget {
  const Rekomendasi({super.key});

  @override
  State<Rekomendasi> createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {
  @override
  Widget build(BuildContext context) {
    final dataPopularCourse = Provider.of<PopularViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Kursus Populer',
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
                  itemCount: dataPopularCourse.popularCourse.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.9,
                    mainAxisExtent: 224,
                  ),
                  itemBuilder: (context, index) {
                    return KelasCourse(
                        courseModel: dataPopularCourse.popularCourse[index],
                        fontSize: 16,
                        height: 104);
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
