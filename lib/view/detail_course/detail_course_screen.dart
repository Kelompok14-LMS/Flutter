import 'package:edu_world/view/detail_course/take_course_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edu_world/models/detail_course_model.dart';
import 'package:flutter/material.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({super.key});

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  double topBarOpacity = 0.0;
  bool _isFavorited = false;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Color(0xFF0C223D),
            ),
          ),
          actions: <Widget>[
            IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.only(right: 10),
                onPressed: _toggleFavorite,
                icon: (_isFavorited
                    ? const Icon(Icons.favorite, color: Color(0xff112D4E))
                    : const Icon(Icons.favorite, color: Color(0xFF8896A7))))
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
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
                    const Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 500),
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const TakeCourseScreen();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(
                                      begin: const Offset(-1, 0),
                                      end: Offset.zero,
                                    );
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  }),
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0xff112D4E)),
                          ),
                          child: const Text(
                            'Ambil Kelas',
                            style: TextStyle(fontSize: 15),
                          )),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: detailCourse.length));
  }

  List<DetailCourseModel> detailCourse = [
    DetailCourseModel(
        image: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
        title: 'Mastering UIX Design for Industry',
        description:
            'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
        favorite: '(65)',
        author: 'Yono Salim')
  ];
}
