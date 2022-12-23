import 'package:edu_world/view/detail_course/components/header_modul_course.dart';
import 'package:edu_world/view/detail_course/components/section_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/components/skeleton.dart';
import 'package:edu_world/view/detail_course/components/assignment_expansion_tile.dart';
import 'package:edu_world/view/detail_course/components/list_course_shimmer.dart';
import 'package:edu_world/view/main_view.dart';
import 'package:edu_world/view_models/couse_view_model.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/main_view_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';

class EnrolledCourseScreen extends StatefulWidget {
  const EnrolledCourseScreen({
    Key? key,
    required this.courseModel,
    required this.mentee,
    required this.isHaveData,
  }) : super(key: key);
  final CourseModel courseModel;
  final String mentee;
  final bool isHaveData;

  @override
  State<EnrolledCourseScreen> createState() => _EnrolledCourseScreenState();
}

class _EnrolledCourseScreenState extends State<EnrolledCourseScreen> {
  double topBarOpacity = 0.0;

  bool isExpansionTrailing = false;

  @override
  void initState() {
    Provider.of<MaterialsViewModel>(context, listen: false)
        .getEnrolledMaterialsModules(widget.mentee, widget.courseModel.id!);

    super.initState();
  }

  Future<bool> checkEnrollment(EnrollViewModel successEnrolled) {
    if (widget.isHaveData || successEnrolled.addCourseSucces) {
      Navigator.pop(context, true);
      return Future.value(true);
    } else {
      Navigator.pop(context, false);
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataMaterials =
        Provider.of<MaterialsViewModel>(context, listen: false);
    final successEnrolled = Provider.of<EnrollViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await checkEnrollment(successEnrolled);
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () async {
              if (widget.isHaveData || successEnrolled.addCourseSucces) {
                Navigator.pop(context, true);
              } else {
                Navigator.pop(context, false);
              }
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
        body: widget.isHaveData || successEnrolled.addCourseSucces
            ? SingleChildScrollView(
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
                          HeaderModulCourse(courseModel: widget.courseModel),
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Theme(
                                              data: Theme.of(context).copyWith(
                                                  dividerColor:
                                                      Colors.transparent),
                                              child: SectionExpansionTile(
                                                modules: dataMaterials
                                                    .modulsEnrolled
                                                    .modules![index],
                                                index: index,
                                                courseModel: widget.courseModel,
                                                mentee: widget.mentee,
                                              )),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(),
                                      itemCount: dataMaterials
                                          .modulsEnrolled.modules!.length);
                                }
                                return const Center(
                                    child: Text('Tidak ada kursus'));
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
                                    Skeleton(
                                        height: 50, width: double.maxFinite),
                                  ],
                                ),
                              );
                            }
                            if (value.courseMaterialsState ==
                                CourseMaterialsState.none) {
                              return dataMaterials.modulsEnrolled.assignment !=
                                      null
                                  ? AssignmentExpansionTile(
                                      dataMaterials:
                                          dataMaterials.modulsEnrolled,
                                      isPreview: false,
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
              )
            : const Center(
                child: Text('Gagal Menambahkan Kursus'),
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
                if (percent >= 1.0 && status == "ongoing") {
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
      ),
    );
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
            'Yakin mau menyelesaikan kursus?',
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
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false);
    Provider.of<MainViewModel>(context, listen: false).selectedDestination(2);
  }
}
