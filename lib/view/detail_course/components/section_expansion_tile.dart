import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/detail_course/components/material_materi_screen.dart';

class SectionExpansionTile extends StatelessWidget {
  const SectionExpansionTile({
    Key? key,
    required this.modules,
    required this.index,
    required this.courseModel,
    required this.mentee,
  }) : super(key: key);
  final Modules modules;
  final int index;
  final CourseModel courseModel;
  final String mentee;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      onExpansionChanged: (value) {},
      title: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 20,
            // width: 70,
            decoration: BoxDecoration(
                color: const Color(0xFFF9F7F7),
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Section ${index + 1}",
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFE4B548),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              modules.title!,
              maxLines: 2,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xff112D4E),
              ),
            ),
          ),
        ],
      ),
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              modules.description!,
              style: MyColor().reviewCourseSubTextStyle,
            )),
        modules.materials != null
            ? Column(
                children: List.generate(
                  modules.materials!.length,
                  (index) => ListTile(
                    dense: true,
                    leading: const Icon(
                      Icons.video_collection,
                      size: 25,
                      color: MyColor.primaryLogo,
                    ),
                    title: Text(
                      modules.materials![index].title!,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff112D4E),
                      ),
                    ),
                    trailing: modules.materials![index].completed!
                        ? const Icon(Icons.check_circle,
                            color: MyColor.primaryLogo)
                        : const Icon(
                            Icons.check_circle,
                            color: Color(0xFFB0B9C4),
                          ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoMateriScreen(
                            mentee: mentee,
                            courseModel: courseModel,
                            materials: modules.materials![index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
