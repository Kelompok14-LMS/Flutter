import 'package:edu_world/models/video_materi_model.dart';
import 'package:edu_world/view/detail_course/slide_materi_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoMateriScreen extends StatefulWidget {
  const VideoMateriScreen({super.key});

  @override
  State<VideoMateriScreen> createState() => _VideoMateriScreenState();
}

class _VideoMateriScreenState extends State<VideoMateriScreen>{


  late VideoPlayerController controller;

  double topBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(detailVideo[0].url!)..addListener(() => setState(() {}))..setLooping(false)..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF0C223D),),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 500,
                child: VideoPlayer(controller)),
              const Divider(
                color: Colors.transparent,
                height: 20,
              ),
              Text(
                detailVideo[0].material_id!,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff112D4E)
                ),
              ),
              const Divider(
                color: Colors.transparent,
                height: 10,
              ),
              Text(
                detailVideo[0].description!,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff112D4E),
                  height: 1.5,
                ),
              ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: (){
              //       Navigator.of(context).push(PageRouteBuilder(
              //         reverseTransitionDuration: const Duration(milliseconds: 500),
              //         transitionDuration: const Duration(milliseconds: 500),
              //         pageBuilder: (context, animation, secondaryAnimation) {
              //         return const SlideMateriScreen();
              //       },
              //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
              //           final tween = Tween(
              //           begin: const Offset(-1, 0),
              //           end: Offset.zero,
              //         );
              //         return SlideTransition(
              //           position: animation.drive(tween),
              //           child: child,
              //         );
              //       }),);
              //     },
              //     style: const ButtonStyle(
              //       backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff112D4E)),
              //     ),
              //     child: const Text('Selanjutnya', style: TextStyle(fontSize: 15),
              //     )
              //   ),
              // ),
              const Divider(
                color: Colors.transparent,
                height: 300,
              ),
              Center(
                child: MaterialButton(
                  minWidth: 373,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  onPressed: (){
                    Navigator.of(context).push(PageRouteBuilder(
                      reverseTransitionDuration: const Duration(milliseconds: 500),
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                      return const SlideMateriScreen();
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
                  color: const Color(0xff112D4E),
                  child: const Text('Selanjutnya', style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontWeight: FontWeight.w500),),
                ),
              )
            ],
          ),
        ),
      ),
      // body: ListView.separated(
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(12),
      //       child: Column(
      //         children: [
      //           Container(
      //             height: 100,
      //             width: 50,
      //           ),
      //           // VideoPlayer(controller),
      //           // YoutubePlayer(
      //           //   controller: controller,
      //           //   showVideoProgressIndicator: true,
      //           // ),
      //           Padding(
      //             padding: const EdgeInsets.only(top: 10),
      //             child: Column(
      //               children: [
      //                 Text(
      //                   detailVideo[0].material_id!,
      //                   style: GoogleFonts.roboto(
      //                     fontSize: 22,
      //                     fontWeight: FontWeight.w500,
      //                     color: const Color(0xff112D4E),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(top: 10),
      //             child: Column(
      //               children: [
      //                 Text(
      //                   detailVideo[0].description!,
      //                   style: GoogleFonts.roboto(
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w500,
      //                     color: const Color(0xff112D4E),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   }, 
      //   separatorBuilder: (context, index) => const Divider(), 
      //   itemCount: detailVideo.length)
    );
  }

  List<VideoMateriModel> detailVideo = [
    VideoMateriModel(
      material_id: 'Latar Belakang Tugas',
      description: 'Menjadi seorang UI/UX, perlu mengetahui dasar daripada UI dan UX dan fungsi seorang UI/UX agar intern paham akan role mereka di perusahaan.',
      url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )
  ];

}