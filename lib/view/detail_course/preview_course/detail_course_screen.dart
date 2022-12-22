import 'package:edu_world/view/detail_course/components/assignment_expansion_tile.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/detail_course/components/review_card.dart';
import 'package:edu_world/view/detail_course/enrolled_course/enrolled_course_screen.dart';
import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:edu_world/view_models/review_view_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/skeleton.dart';
import '../components/list_course_shimmer.dart';

class PreviewCourseScreen extends StatefulWidget {
  const PreviewCourseScreen({
    Key? key,
    required this.courseModel,
    required this.mentee,
  }) : super(key: key);
  final CourseModel courseModel;
  final String mentee;

  @override
  State<PreviewCourseScreen> createState() => _PreviewCourseScreenState();
}

class _PreviewCourseScreenState extends State<PreviewCourseScreen> {
  @override
  void initState() {
    context.read<ReviewCourseViewModel>().reviewCourse.clear();
    Provider.of<MaterialsViewModel>(context, listen: false)
        .getPreviewMaterialsModules(widget.courseModel.id!);
    context
        .read<ReviewCourseViewModel>()
        .getCourseReview(widget.courseModel.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataMaterials =
        Provider.of<MaterialsViewModel>(context, listen: false);
    final dataReview = context.watch<ReviewCourseViewModel>().reviewCourse;
    final dataEnroll = Provider.of<EnrollViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
                      width: 388,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.courseModel.title!,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff112D4E),
                        ),
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
                        const Icon(
                          Icons.star,
                          color: Color(0xFFE4B548),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          widget.courseModel.rating!.toString(),
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff112D4E),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          ('(${widget.courseModel.totalReviews!.toString()})'),
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF8896A6),
                          ),
                        ),
                      ],
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
                      height: 20,
                    ),
                    Consumer<MaterialsViewModel>(builder: (context, data, _) {
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
                        if (data.modulsPreview.modules!.isNotEmpty) {
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
                                            .modulsPreview.modules![index],
                                        index),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(),
                              itemCount:
                                  dataMaterials.modulsPreview.modules!.length);
                        }
                        return const Center(child: Text('Tidak ada kursus'));
                      }
                    }),
                    Consumer<MaterialsViewModel>(
                        builder: (context, data, child) {
                      if (data.courseMaterialsState ==
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
                      if (data.courseMaterialsState ==
                          CourseMaterialsState.none) {
                        return dataMaterials.modulsPreview.assignment != null
                            ? AssignmentExpansionTile(
                                isPreview: true,
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
              Container(
                color: MyColor.review,
                width: double.maxFinite,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ulasan',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff112D4E),
                        ),
                      ),
                      Column(
                        children: List.generate(
                          dataReview.length,
                          (index) => ReviewCard(
                            data: dataReview[index],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 96,
          color: Colors.transparent,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                if (dataEnroll.isEnrolled!) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EnrolledCourseScreen(
                          isHaveData: true,
                          mentee: widget.mentee,
                          courseModel: widget.courseModel),
                    ),
                  );
                } else {
                  showAlertDialogFunction();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColor.primaryLogo,
              ),
              child: Text(
                  dataEnroll.isEnrolled! ? 'Lanjutkan Belajar' : 'Ambil Kursus',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primary)),
            ),
          ),
        ));
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
            'Apakah kamu yakin ingin mengambil kursus ini?',
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
    Provider.of<EnrollViewModel>(context, listen: false)
        .enrollCourse(widget.courseModel.id!, widget.mentee);
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
            'Dimasukkan ke Kursusku',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 2));
    // Navigator.pop(context);
    if (!mounted) return;
    final data = await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => EnrolledCourseScreen(
            isHaveData: false,
            mentee: widget.mentee,
            courseModel: widget.courseModel),
      ),
    );
    if (!mounted) return;
    Provider.of<EnrollViewModel>(context, listen: false).changeIsEnrolled(data);
  }
}
