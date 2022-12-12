import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/home/components/category_card.dart';
import 'package:edu_world/view/home/components/home_course.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:edu_world/view_models/list_course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomTabBarButton extends StatefulWidget {
  const CustomTabBarButton({super.key});

  @override
  State<CustomTabBarButton> createState() => _CustomTabBarButtonState();
}

class _CustomTabBarButtonState extends State<CustomTabBarButton> {
  List<String> items = [
    "Semua Topik",
    "UI/UX",
    "Front End",
    "Back End",
  ];

  /// List of body icon

  int current = 0;

  @override
  Widget build(BuildContext context) {
    final listCourseViewModel = Provider.of<ListCourseViewModel>(context);
    final courseClassViewModel = Provider.of<CourseViewModel>(context);

    List<Widget> icons = [
      HomeCourse(
        courseClassViewModel: courseClassViewModel,
        listCourseViewModel: listCourseViewModel,
      ),
      const CategoryCard(category: "UI/UX"),
      const Text('data'),
      const Text('data'),
    ];
    return Expanded(
      child: Column(
        children: [
          /// CUSTOM TABBAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        // width: 80,
                        // height: 45,
                        decoration: BoxDecoration(
                          color: current == index
                              ? MyColor.primaryLogo
                              : Colors.white54,
                          borderRadius: current == index
                              ? BorderRadius.circular(16)
                              : BorderRadius.circular(16),
                          border: current == index
                              ? Border.all(color: MyColor.primaryLogo, width: 2)
                              : Border.all(color: MyColor.primary),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Text(
                              items[index],
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  color: MyColor.primary),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          icons[current]
        ],
      ),
    );
  }
}
