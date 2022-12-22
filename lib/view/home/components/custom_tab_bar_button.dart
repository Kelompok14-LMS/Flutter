import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/home/components/category_card.dart';
import 'package:edu_world/view/home/components/home_course.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
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
  int buttonCounterUiUx = 0;
  int buttonCounterFrontEnd = 0;
  int buttonCounterBackEnd = 0;

  @override
  Widget build(BuildContext context) {
    final courseClassViewModel = Provider.of<CourseViewModel>(context);

    List<Widget> icons = [
      HomeCourse(
        courseClassViewModel: courseClassViewModel,
      ),
      const CategoryCard(category: "UI/UX"),
      const CategoryCard(category: "Front End"),
      const CategoryCard(category: "Back End"),
    ];
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),

          /// CUSTOM TABBAR
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Row(
                    children: [
                      Visibility(
                        visible: index == 0,
                        child: const SizedBox(
                          width: 24,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            current = index;
                          });
                          if (index == 1) {
                            buttonCounterUiUx++;
                            if (buttonCounterUiUx <= 1) {
                              Provider.of<CourseViewModel>(context,
                                      listen: false)
                                  .getCoursebyCategory("UI/UX");
                            }
                          }
                          if (index == 2) {
                            buttonCounterFrontEnd++;
                            if (buttonCounterFrontEnd <= 1) {
                              Provider.of<CourseViewModel>(context,
                                      listen: false)
                                  .getCoursebyCategory("Front End");
                            }
                          }
                          if (index == 3) {
                            buttonCounterBackEnd++;
                            if (buttonCounterBackEnd <= 1) {
                              Provider.of<CourseViewModel>(context,
                                      listen: false)
                                  .getCoursebyCategory("Back End");
                            }
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: current == index
                                ? MyColor.primaryLogo
                                : Colors.white54,
                            borderRadius: current == index
                                ? BorderRadius.circular(16)
                                : BorderRadius.circular(16),
                            border: current == index
                                ? Border.all(
                                    color: MyColor.primaryLogo, width: 2)
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
                      ),
                      Visibility(
                        visible: index == 3,
                        child: const SizedBox(
                          width: 24,
                        ),
                      ),
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(0.3), width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 0.8,
                    blurRadius: 10,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ]),
          ),
          icons[current]
        ],
      ),
    );
  }
}
