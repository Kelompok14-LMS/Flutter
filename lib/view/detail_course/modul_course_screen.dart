import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/models/detail_course_model.dart';
import 'package:edu_world/models/modules_model.dart';
import 'package:edu_world/models/review_card_model.dart';
import 'package:edu_world/models/title_course_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/detail_course/components/review_card.dart';
import 'package:edu_world/view/detail_course/material_materi_screen.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool isComplate = false;

  @override
  void initState() {
    Provider.of<MaterialsViewModel>(context, listen: false)
        .getPreviewMaterialsModules(widget.courseModel.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataMaterials = Provider.of<MaterialsViewModel>(context);
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
                        Text(
                          detailCourse[0].rating!,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff112D4E),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          detailCourse[0].jumlahRating!,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB8C0CA),
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
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
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
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                onExpansionChanged: (value) {
                                  setState(() {
                                    isExpansionTrailing = value;
                                  });
                                },
                                title: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      height: 20,
                                      // width: 70,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFF9F7F7),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            "Section",
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
                                        dataMaterials.moduls[index].title!,
                                        maxLines: 2,
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff112D4E),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isExpansionTrailing,
                                      child: const Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB0B9C4),
                                      ),
                                    ),
                                  ],
                                ),
                                children: [
                                  Visibility(
                                    visible:
                                        dataMaterials.moduls[index].materials !=
                                            null,
                                    child: ListTile(
                                      dense: true,
                                      leading: const Icon(
                                        Icons.play_circle_filled_outlined,
                                        size: 25,
                                        color: Color(0xff112D4E),
                                      ),
                                      title: Text("Dummy",
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff112D4E),
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB0B9C4),
                                      ),
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VideoMateriScreen(
                                              courseModel: widget.courseModel,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        dataMaterials.moduls[index].materials !=
                                            null,
                                    child: ListTile(
                                      dense: true,
                                      leading: const Icon(
                                        Icons.play_circle_filled_outlined,
                                        size: 25,
                                        color: Color(0xff112D4E),
                                      ),
                                      title: Text("Dummy",
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff112D4E),
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB0B9C4),
                                      ),
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VideoMateriScreen(
                                              courseModel: widget.courseModel,
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: dataMaterials.moduls.length),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      );
  }

  List<DetailCourseModel> detailCourse = [
    DetailCourseModel(
        image: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
        title: 'Mastering UIX Design for Industry',
        description:
            'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
        author: 'Yono Salim',
        rating: '4.6',
        jumlahRating: '(86)'),
    DetailCourseModel(
      image: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
      title: 'Becoming Full Stack Web Developer',
      description:
          'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
      author: 'Yono Salim',
    )
  ];

  List<ReviewCardModel> dummyCardReview = [
    ReviewCardModel(
      image:
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
      name: 'Gilang Dirga',
      rating: 4,
      reviewText: 'Kursus ini sangat bagus untuk pemula',
    ),
    ReviewCardModel(
      image:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      name: 'Bintang Bulan',
      rating: 5,
      reviewText: 'Saya sangat terbantu dengan adanya kursus ini',
    ),
    ReviewCardModel(
      image:
          'https://images.unsplash.com/photo-1540569014015-19a7be504e3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      name: 'Yudi Sembako',
      rating: 5,
      reviewText: 'Terima kasih banyak Christine, kursusmu sangat membantuku',
    ),
  ];
}
