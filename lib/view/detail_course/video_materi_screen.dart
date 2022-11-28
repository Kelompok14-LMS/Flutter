import 'package:edu_world/models/video_materi_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class VideoMateriScreen extends StatefulWidget {
  const VideoMateriScreen({super.key});

  @override
  State<VideoMateriScreen> createState() => _VideoMateriScreenState();
}

class _VideoMateriScreenState extends State<VideoMateriScreen>{

  double topBarOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: topBarOpacity,
        backgroundColor: Colors.white,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF0C223D),),
            ),
          ],
        ),
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
                    // image: DecorationImage(
                    //   image: NetworkImage(detailCourse[0].image!),
                    //   fit: BoxFit.cover
                    // ),
                  ),
                  height: 166,
                  width: 388,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        detailVideo[0].material_id!,
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff112D4E),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        detailVideo[0].description!,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff112D4E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }, 
        separatorBuilder: (context, index) => const Divider(), 
        itemCount: detailVideo.length)
    );
  }

  List<VideoMateriModel> detailVideo = [
    VideoMateriModel(
      material_id: 'Latar Belakang Tugas',
      description: 'Menjadi seorang UI/UX, perlu mengetahui dasar daripada UI dan UX dan fungsi seorang UI/UX agar intern paham akan role mereka di perusahaan.'
    )
  ];

}