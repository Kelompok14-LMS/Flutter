import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/models/review_card_model.dart';
import 'package:edu_world/models/title_course_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/detail_course/components/review_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edu_world/models/detail_course_model.dart';
import 'package:flutter/material.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  final CourseModel courseModel;

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  @override
  Widget build(BuildContext context) {
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
                            image: NetworkImage(detailCourse[0].image!),
                            fit: BoxFit.cover),
                      ),
                      height: 166,
                      width: 388,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        detailCourse[0].title!,
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
                          detailCourse[0].author!,
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
                        detailCourse[0].description!,
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
                                            dummyTitle[index].section!,
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
                                    Text(
                                      dummyTitle[index].titleSection!,
                                      style: GoogleFonts.roboto(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff112D4E),
                                      ),
                                    ),
                                  ],
                                ),
                                children: [
                                  ListTile(
                                    dense: true,
                                    leading: const Icon(
                                      Icons.play_circle_filled_outlined,
                                      size: 25,
                                      color: Color(0xff112D4E),
                                    ),
                                    title: Text(dummyTitle[index].videoPertama!,
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff112D4E),
                                        )),
                                  ),
                                  ListTile(
                                    dense: true,
                                    leading: const Icon(
                                      Icons.play_circle_filled_outlined,
                                      size: 25,
                                      color: Color(0xff112D4E),
                                    ),
                                    title: Text(dummyTitle[index].videoKedua!,
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff112D4E),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: dummyTitle.length),
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
                          dummyCardReview.length,
                          (index) => ReviewCard(
                            cardModel: dummyCardReview[index],
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColor.primaryLogo,
              ),
              child: Text('Ambil Kursus',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primary)),
            ),
          ),
        ));
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

  List<TitleCourseModel> dummyTitle = [
    TitleCourseModel(
      titleSection: 'Introduction',
      section: 'Section 1',
      videoPertama: "Hello! Let's learn UI/UX",
      videoKedua: 'What to Prepare?',
    ),
    TitleCourseModel(
      titleSection: 'What is UI?',
      section: 'Section 2',
      videoPertama: "Let's learn UI",
      videoKedua: 'What do you must know about UI',
    ),
    TitleCourseModel(
      titleSection: 'What is UX?',
      section: 'Section 3',
      videoPertama: "Let's learn UI",
      videoKedua: 'What do you must know about UI',
    ),
    TitleCourseModel(
      titleSection: 'What are the Tools?',
      section: 'Section 4',
      videoPertama: "Let's learn UI",
      videoKedua: 'What do you must know about UI',
    ),
    TitleCourseModel(
      titleSection: 'Human-Centered Design',
      section: 'Section 5',
      videoPertama: "Let's learn UI",
      videoKedua: 'What do you must know about UI',
    ),
    TitleCourseModel(
      titleSection: 'Resume',
      section: 'Assignment',
      videoPertama: "Let's learn UI",
      videoKedua: 'What do you must know about UI',
    ),
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
