import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/skeleton.dart';
import 'package:edu_world/view/detail_course/components/assignment_expansion_tile.dart';
import 'package:edu_world/view/detail_course/components/list_course_shimmer.dart';
import 'package:edu_world/view/detail_course/material_materi_screen.dart';
import 'package:edu_world/view/main_view.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:edu_world/view_models/main_view_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ModulCourseScreen extends StatefulWidget {
  const ModulCourseScreen({
    Key? key,
    required this.courseModel,
    required this.mentee,
  }) : super(key: key);
  final CourseModel courseModel;
  final String mentee;

  @override
  State<ModulCourseScreen> createState() => _ModulCourseScreenState();
}

class _ModulCourseScreenState extends State<ModulCourseScreen> {
  double topBarOpacity = 0.0;

  bool isExpansionTrailing = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<MaterialsViewModel>(context, listen: false)
      //     .addCourseId(widget.courseModel.id!);
    });
    Provider.of<MaterialsViewModel>(context, listen: false)
        .getEnrolledMaterialsModules(widget.mentee, widget.courseModel.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataMaterials =
        Provider.of<MaterialsViewModel>(context, listen: false);
    // print(
    //     'ini id nya${dataMaterials.modulsEnrolled.assignment!.assignmentId!}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {
            // Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false);
            Provider.of<MainViewModel>(context, listen: false)
                .selectedDestination(1);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Color(0xFF0C223D),
          ),
        ),
        title: Text(
          'Kembali',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color(0xff112D4E),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(widget.courseModel.thumbnail!),
                          fit: BoxFit.cover),
                    ),
                    height: 166,
                    width: double.maxFinite,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                widget.courseModel.title!,
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff112D4E),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  'by ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff112D4E),
                                  ),
                                ),
                                Text(
                                  widget.courseModel.mentorName!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff112D4E),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Consumer<MaterialsViewModel>(
                            builder: (context, data, _) {
                          if (data.courseMaterialsState ==
                              CourseMaterialsState.loading) {
                            return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade500,
                                loop: 3,
                                child: const Skeleton(height: 50, width: 50));
                          }
                          if (data.courseMaterialsState ==
                              CourseMaterialsState.error) {
                            return const Text('Error');
                          } else {
                            if (data.modulsEnrolled.progress == null) {
                              return const CircularProgressIndicator();
                            } else {
                              final percent = (data.modulsEnrolled.progress! /
                                  data.modulsEnrolled.totalMaterials!);
                              return CircularPercentIndicator(
                                radius: 24.0,
                                lineWidth: 7.0,
                                percent: percent.isNaN
                                    ? 0.0
                                    : percent <= 1
                                        ? percent
                                        : 1,
                                animation: true,
                                animationDuration: 1000,
                                center: Text(
                                  percent.isNaN
                                      ? "${(0.0 * 100)}%"
                                      : "${((percent <= 1 ? percent : 1) * 100).toInt()}%",
                                  style:
                                      const TextStyle(color: MyColor.primary),
                                ),
                                progressColor: MyColor.primaryLogo,
                                circularStrokeCap: CircularStrokeCap.round,
                              );
                            }
                          }
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      widget.courseModel.description!,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff112D4E),
                        height: 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<MaterialsViewModel>(
                    builder: (context, data, _) {
                      if (data.courseMaterialsState ==
                          CourseMaterialsState.loading) {
                        return const ListCourseShimmer();
                      }
                      if (data.courseMaterialsState ==
                          CourseMaterialsState.error) {
                        return const Text('Gagal mengambil data');
                      } else {
                        if (data.errorMessage == "502") {
                          return const Center(
                              child: Text(
                            'Error 502, gagal memuat data',
                            style: TextStyle(color: MyColor.primary),
                          ));
                        }
                        if (data.modulsEnrolled.modules!.isNotEmpty) {
                          return ListView.separated(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors.transparent),
                                      child: buildExpansionTile(
                                          dataMaterials
                                              .modulsEnrolled.modules![index],
                                          index)),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(),
                              itemCount:
                                  dataMaterials.modulsEnrolled.modules!.length);
                        }
                        return const Center(child: Text('Tidak ada kursus'));
                      }
                    },
                  ),
                  Consumer<MaterialsViewModel>(
                      builder: (context, value, child) {
                    if (value.courseMaterialsState ==
                        CourseMaterialsState.loading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade500,
                        loop: 3,
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Skeleton(height: 50, width: double.maxFinite),
                          ],
                        ),
                      );
                    }
                    if (value.courseMaterialsState ==
                        CourseMaterialsState.none) {
                      return dataMaterials.modulsEnrolled.assignment != null
                          ? AssignmentExpansionTile(
                              dataMaterials: dataMaterials.modulsEnrolled,
                            )
                          : Container();
                    }
                    return Container();
                  })
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<MaterialsViewModel>(
        builder: (context, value, _) {
          if (value.courseMaterialsState == CourseMaterialsState.loading) {
            return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade500,
                loop: 3,
                child: const Skeleton(height: 50, width: 50));
          }
          if (value.courseMaterialsState == CourseMaterialsState.error) {
            return const Text('Error');
          }
          if (value.courseMaterialsState == CourseMaterialsState.none) {
            if (value.modulsEnrolled.progress == null) {
              return const CircularProgressIndicator();
            } else {
              final percent = (value.modulsEnrolled.progress! /
                  value.modulsEnrolled.totalMaterials!);
              final status = widget.courseModel.status ?? "completed";
              print(status);
              if (percent == 1.0 && status == "ongoing") {
                return Container(
                  height: 96,
                  color: Colors.transparent,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showAlertDialogFunction();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.primaryLogo,
                      ),
                      child: Text('Selesaikan Kursus',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: MyColor.primary)),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }
          }

          return Container();
        },
      ),
    );
  }

  Widget buildExpansionTile(Modules a, int index) {
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
                a.title!,
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
                a.description!,
                style: MyColor().reviewCourseSubTextStyle,
                textAlign: TextAlign.justify,
              )),
          a.materials != null
              ? Column(
                  children: List.generate(
                  a.materials!.length,
                  (index) => ListTile(
                    dense: true,
                    leading: const Icon(
                      Icons.video_collection,
                      size: 25,
                      color: MyColor.primaryLogo,
                    ),
                    title: Text(
                      a.materials![index].title!,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff112D4E),
                      ),
                    ),
                    trailing: a.materials![index].completed!
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
                            mentee: widget.mentee,
                            courseModel: widget.courseModel,
                            materials: a.materials![index],
                          ),
                        ),
                      );
                    },
                  ),
                ))
              : Container()
        ]);
  }

  void showAlertDialogFunction() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 59, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          title: const Text(
            'Ingin menyelesaikan kursus?',
            textAlign: TextAlign.center,
            style: TextStyle(color: MyColor.primary, fontSize: 17),
          ),
          content: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                        Provider.of<CourseViewModel>(context, listen: false)
                            .submitCompleteCourse(
                                widget.mentee, widget.courseModel.id!);
                        await showSuccessAddCourse();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          backgroundColor: MyColor.primaryLogo),
                      child: const Text('Iya'),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16)),
                        ),
                      ),
                      child: const Text(
                        'Tidak',
                        style: TextStyle(color: MyColor.primaryLogo),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showSuccessAddCourse() async {
    Navigator.pop(context);
    // Provider.of<EnrollViewModel>(context, listen: false)
    //     .enrollCourse(widget.courseModel.id!, widget.mentee);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Icon(
            Icons.check_circle,
            color: MyColor.primaryLogo,
            size: 56,
          ),
          content: const Text(
            'Kursus Selesai',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    // Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false);
    Provider.of<MainViewModel>(context, listen: false).selectedDestination(2);
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => ModulCourseScreen(
    //         mentee: widget.mentee, courseModel: widget.courseModel),
    //   ),
    // );
  }
}
