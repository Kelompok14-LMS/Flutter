import 'package:edu_world/models/detail_course_model.dart';
import 'package:edu_world/models/modules_model.dart';
import 'package:edu_world/models/title_course_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ModulCourseScreen extends StatefulWidget {
  const ModulCourseScreen({
    Key? key,
    // required this.courseModel,
  }) : super(key: key);
  // final CourseModel courseModel;

  @override
  State<ModulCourseScreen> createState() => _ModulCourseScreenState();
}

class _ModulCourseScreenState extends State<ModulCourseScreen> {
  double topBarOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: topBarOpacity,
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(12),
              //   image: DecorationImage(
              //     image: NetworkImage(detailCourse[0].image!),
              //     fit: BoxFit.cover
              //   ),
              // ),
              // height: 166,
              // width: 388,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Text(
              //     detailCourse[0].title!,
              //     style: GoogleFonts.roboto(
              //       fontSize: 20,
              //       fontWeight: FontWeight.w500,
              //       color: const Color(0xff112D4E),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 7,
              // ),
              // Row(
              //   children: [
              //     Text(
              //       'by ',
              //       style: GoogleFonts.roboto(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w500,
              //           color: const Color(0xff112D4E),
              //       ),
              //     ),
              //     Text(
              //       detailCourse[0].author!,
              //       style: GoogleFonts.roboto(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w500,
              //         color: const Color(0xff112D4E),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 7,
              //     ),
              //     const Icon(
              //       Icons.star,
              //       color: Color(0xFFE4B548),
              //       size: 20,
              //     ),
              //     Text(
              //       detailCourse[0].rating!,
              //       style: GoogleFonts.roboto(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w500,
              //         color: const Color(0xff112D4E),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 3,
              //     ),
              //     Text(
              //       detailCourse[0].jumlahRating!,
              //       style: GoogleFonts.roboto(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w500,
              //         color: const Color(0xFFB8C0CA),
              //       ),
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8),
              //   child: Text(
              //     detailCourse[0].description!,
              //     style: GoogleFonts.roboto(
              //         fontSize: 14,
              //         fontWeight: FontWeight.normal,
              //         color: const Color(0xff112D4E),
              //         height: 2,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(PageRouteBuilder(
                      reverseTransitionDuration: const Duration(milliseconds: 500),
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                      return const ModulCourseScreen();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    );
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                    }),);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFE4B548)),
                  ),
                  child: const Text('Ambil Kelas', style: TextStyle(fontSize: 15, color: Color(0xff112D4E)),)
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFB8C0CA),
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          offset: Offset(0, 1)
                        )
                      ]
                    ),
                    child: ExpansionTile(
                      title: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E6EA),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
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
                          title: Text(
                            dummyTitle[index].videoPertama!,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff112D4E),
                            )
                          ),
                        ),
                        ListTile(
                          dense: true,
                          // visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                          leading: const Icon(
                            Icons.play_circle_filled_outlined, 
                            size: 25,
                            color: Color(0xff112D4E),
                          ),
                          title: Text(
                            dummyTitle[index].videoKedua!,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff112D4E),
                            )
                          ),
                        ),
                      ],
                    ),
                  );
                }, 
                separatorBuilder: (context, index) => const SizedBox(height: 10), 
                itemCount: dummyTitle.length
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Ulasan',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff112D4E),
                )
              ),
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFB8C0CA),
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          offset: Offset(0, 1)
                        )
                      ]
                    ),
                  );
                }, 
                separatorBuilder: (context, index) => const SizedBox(height: 10), 
                itemCount: dummyTitle.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // List<DetailCourseModel> detailCourse = [
  //   DetailCourseModel(
  //     image: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
  //     title: 'Mastering UIX Design for Industry',
  //     description: 'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
  //     author: 'Yono Salim',
  //     rating: '4.6',
  //     jumlahRating: '(86)'
  //   ),
  //   DetailCourseModel(
  //     image: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
  //     title: 'Becoming Full Stack Web Developer',
  //     description: 'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
  //     author: 'Yono Salim',
  //   )
  // ];

  // List<ModulesModel> modules = [
  //   ModulesModel(
  //     title: title, 
  //     description: description,
  //   ),
  // ];

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
  ];
}
