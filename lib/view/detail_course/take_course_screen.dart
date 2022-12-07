import 'package:edu_world/models/detail_course_model.dart';
import 'package:edu_world/view/detail_course/video_materi_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class TakeCourseScreen extends StatefulWidget {
  const TakeCourseScreen({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  final CourseModel courseModel;

  @override
  State<TakeCourseScreen> createState() => _TakeCourseScreenState();
}

class _TakeCourseScreenState extends State<TakeCourseScreen> {
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

  static final List<String> items = <String>[
    'Video Materi',
    'Slide Materi',
    'Tugas',
  ];

  String? selectedValue;

  String dropDownValue = items.first;

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
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF0C223D),),
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
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
              child: Center(
                child: Text(
                  widget.courseModel.title!,
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
                widget.courseModel.descriptions!,
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
              children: const [
                Icon(Icons.favorite, color: Color(0xFF8896A7)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('65'),
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
                  widget.courseModel.mentorName!,
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
              height: 15,
              color: Colors.transparent,
            ),
            Center(
              child: Column(
                children: [
                  selection1(),
                  const Divider(
                    height: 10,
                    color: Colors.transparent,
                  ),
                  selection2(),
                  const Divider(
                    height: 10,
                    color: Colors.transparent,
                  ),
                  selection3(),
                  const Divider(
                    height: 10,
                    color: Colors.transparent,
                  ),
                  selection4(),
                ],
              ),
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
      description: 'Kebutuhan UI/UX Designer terus meningkat hingga 20% dari tahun ke tahun. Sedangkan talenta yang ada belum dapat memenuhinya. UI/UX Designer juga salah satu karir yang akan terus dibutuhkan bahkan hingga 2028, disebut-sebut sebagai salah satu karir paling ‘hot’ di dunia teknologi saat ini.',
      favorite: '(65)',
      author: 'Yono Salim'
    )
  ];

  Widget selection1() => Container(
    width: 328,
    height: 48,
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Color(0xFFB8C0CA),
          spreadRadius: 3,
          blurRadius: 8,
          offset: Offset(0, 1),
        ),
      ],
      borderRadius: BorderRadius.circular(12),
      color: Colors.white
    ),
    child: DropdownButtonHideUnderline(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DropdownButton2(
          hint: Text(
            'Selection 1',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff112D4E),
            ),
          ),
          items: const <DropdownMenuItem>[
            DropdownMenuItem(
              value: 'Video Materi',
              child: Text('Video Materi')
            ),
            DropdownMenuItem(
              value: 'Slide Materi',
              child: Text('Slide Materi')
            ),
            DropdownMenuItem(
              value: 'Tugas',
              child: Text('Tugas')
            ),
          ],
          onChanged: (value) {
            selectedValue = value;
            setState(() {});
          },
          // items: items.map((item) => DropdownMenuItem<String>(
          //   value: item,
          //   child: Text(
          //     item,
          //     style: const TextStyle(
          //     fontWeight: FontWeight.w500,
          //     fontSize: 16,
          //     ),
          //   ))
          // ).toList(),
          // value: selectedValue,
          // onChanged: (String? newValue) {
          //   if (newValue != dropDownValue) {
          //     switch (newValue) {
          //       case 'Video Materi': 
          //         Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VideoMateriScreen()));
          //         break;
          //       // case 'Slide Materi': 
          //       //   Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VideoMateriScreen()));
          //       //   break;
          //       // case 'Tugas': 
          //       //   Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VideoMateriScreen()));
          //       //   break;
          //     }
          //   }
          //   setState(() {
          //     dropDownValue = newValue!;
          //   });
          // },
          buttonHeight: 40,
          buttonWidth: 10,
          itemHighlightColor: const Color(0xff112D4E),
        ),
      ),
    ),
  );
  
  // Widget selection1() => Container(
  //   width: 328,
  //   height: 48,
  //   decoration: BoxDecoration(
  //     boxShadow: const [
  //       BoxShadow(
  //         color: Color(0xFFB8C0CA),
  //         spreadRadius: 3,
  //         blurRadius: 8,
  //         offset: Offset(0, 1),
  //       ),
  //     ],
  //     borderRadius: BorderRadius.circular(12),
  //     color: Colors.white
  //   ),
  //   child: DropdownButtonHideUnderline(
  //     child: Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: DropdownButton(
  //         hint: Text(
  //           'Selection 1',
  //           style: GoogleFonts.roboto(
  //             fontSize: 16,
  //             fontWeight: FontWeight.w500,
  //             color: const Color(0xff112D4E),
  //           ),
  //         ),
  //         items: items.map((item) => DropdownMenuItem<String>(
  //           value: item,
  //           child: Text(
  //             item,
  //             style: const TextStyle(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 16,
  //             ),
  //           ),
  //           )
  //         ).toList(),
  //         // onChanged: (value) => setState(() {
  //         //   dropDownValue = dropDownValue;
  //         //   }
  //         // ),
  //         onChanged: (String? newValue) {
  //           if (newValue != dropDownValue) {
  //             switch (newValue) {
  //               case 'Video Materi': 
  //                 Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VideoMateriScreen()));
  //                 break;
  //               // case 'Slide Materi': 
  //               //   Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VideoMateriScreen()));
  //               //   break;
  //               // case 'Tugas': 
  //               //   Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VideoMateriScreen()));
  //               //   break;
  //             }
  //           }
  //           setState(() {
  //             dropDownValue = newValue!;
  //           });
  //         },
  //       ),
  //     ),
  //   ),
  // );


  Widget selection2() => Container(
        width: 328,
        height: 48,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color(0xFFB8C0CA),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButton(
              hint: Text(
                'Selection 2',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff112D4E),
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => setState(() {
                dropDownValue = dropDownValue;
              }),
            ),
          ),
        ),
      );

  Widget selection3() => Container(
        width: 328,
        height: 48,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color(0xFFB8C0CA),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButton(
              hint: Text(
                'Selection 3',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff112D4E),
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => setState(() {
                dropDownValue = dropDownValue;
              }),
            ),
          ),
        ),
      );

  Widget selection4() => Container(
        width: 328,
        height: 48,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color(0xFFB8C0CA),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButton(
              hint: Text(
                'Selection 4',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff112D4E),
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => setState(() {
                dropDownValue = dropDownValue;
              }),
            ),
          ),
        ),
      );
}
