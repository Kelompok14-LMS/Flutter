import 'package:edu_world/models/title_course_model.dart';
import 'package:edu_world/view/detail_course/take_course_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edu_world/models/detail_course_model.dart';
import 'package:flutter/material.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({super.key});

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen>{
  double topBarOpacity = 0.0;
  bool _isFavorited = false;
  int _favoriteCount = 0;
  

  void _toggleFavorite(){
    setState(() {
      if (_isFavorited){
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: topBarOpacity,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF0C223D),),
        ),
        actions: <Widget>[
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: const EdgeInsets.only(right: 10),
            onPressed: _toggleFavorite, 
            icon: (_isFavorited ? const Icon(Icons.favorite, color: Color(0xff112D4E)) : const Icon(Icons.favorite, color: Color(0xFF8896A7)))
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(detailCourse[0].image!),
                  fit: BoxFit.cover
                ),
              ),
              height: 166,
              width: 388,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    detailCourse[0].title!,
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff112D4E),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  detailCourse[0].description!,
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff112D4E),
                      height: 2,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.favorite, color: Color(0xFF8896A7)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(detailCourse[0].favorite!),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Dibuat oleh ',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF8896A7),
                        height: 2,
                    ),
                  ),
                  Text(
                    detailCourse[0].author!,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff112D4E),
                        height: 2,
                    ),
                  ),
                ],
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
                      leading: Container(
                        // width: 40,
                        height: 40,
                        // width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.network(detailCourse[0].image!),
                      ),
                      // leading: CircleAvatar(
                      //   child: Image.network(
                      //     detailCourse[0].image!,
                      //     fit: BoxFit.fitWidth,
                      //   ),
                      // ),
                      // leading: SizedBox(
                      //   height: 10,
                      //   width: 10,
                      //   child: Image.network(detailCourse[0].image!),
                      // ),
                      // leading: ConstrainedBox(
                      //   constraints: const BoxConstraints(
                      //     minWidth: 35,
                      //     minHeight: 35,
                      //     maxHeight: 35,
                      //     maxWidth: 35,
                      //   ),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10)
                      //     ),
                      //     child: Image.network(
                      //       detailCourse[0].image!, 
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      // leading: CircleAvatar(
                      //   backgroundImage: Image.network(detailCourse[0].image!),
                      // ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dummyTitle[index].title_course!,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff112D4E),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E6EA),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                dummyTitle[index].section!, 
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff112D4E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        ListTile(
                          dense: true,
                          // visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                          leading: const Icon(
                            Icons.play_circle_filled_outlined, 
                            size: 25,
                            color: Color(0xff112D4E),
                          ),
                          title: Text(
                            dummyTitle[index].title_video!,
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
                            Icons.attach_file_rounded, 
                            size: 25,
                            color: Color(0xff112D4E),
                          ),
                          title: Text(
                            dummyTitle[index].title_slide!,
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff112D4E),
                            )
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(
                            Icons.add_task, 
                            size: 25,
                            color: Color(0xff112D4E),
                          ),
                          title: Text(
                            dummyTitle[index].title_tugas!,
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
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(PageRouteBuilder(
                      reverseTransitionDuration: const Duration(milliseconds: 500),
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                      return const TakeCourseScreen();
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
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff112D4E)),
                  ),
                  child: const Text('Ambil Kelas', style: TextStyle(fontSize: 15),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DetailCourseModel> detailCourse = [
    DetailCourseModel(
      image: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
      title: 'Mastering UIX Design for Industry',
      description: 'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
      favorite: '(65)',
      author: 'Yono Salim',
    ),
    DetailCourseModel(
      image: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
      title: 'Becoming Full Stack Web Developer',
      description: 'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
      favorite: '(65)',
      author: 'Yono Salim',
    )
  ];

  List<TitleCourseModel> dummyTitle = [
    TitleCourseModel(
      title_course: 'Mastering UIX Design for Industry',
      section: 'Section 1',
      title_video: 'Memahami Tentang Mastering UIX Design for Industry',
      title_slide: 'Materi Tentang Mastering UIX Design for Industry',
      title_tugas: 'Tugas Mastering UIX Design for Industry'
    ),
    TitleCourseModel(
      title_course: 'Becoming fullstack Web Developer',
      section: 'Section 2',
      title_video: 'Memahami Tentang Becoming fullstack Web Developer',
      title_slide: 'Materi Tentang Becoming fullstack Web Developer',
      title_tugas: 'Tugas Becoming fullstack Web Developer'
    ),
    TitleCourseModel(
      title_course: 'Business Analyst untuk membantu UMKM',
      section: 'Section 3',
      title_video: 'Memahami Tentang Business Analyst untuk membantu UMKM',
      title_slide: 'Materi Tentang Business Analyst untuk membantu UMKM',
      title_tugas: 'Tugas Business Analyst untuk membantu UMKM'
    ),
  ];
}