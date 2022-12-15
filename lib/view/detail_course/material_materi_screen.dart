import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/models/video_materi_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoMateriScreen extends StatefulWidget {
  const VideoMateriScreen ({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  final CourseModel courseModel;

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
    Provider.of<MaterialsViewModel>(context, listen: false)
        .getPreviewMaterialsModules(widget.courseModel.id!);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
          'Section 1',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(100),
                // ),
                height: 200,
                width: 500,
                child: VideoPlayer(controller)
              ),
              const Divider(
                color: Colors.transparent,
                height: 20,
              ),
              Text(
                widget.courseModel.materials.toString(),
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
              const Divider(
                color: Colors.transparent,
                height: 300,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){}, 
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFE4B548)),
                    maximumSize: MaterialStateProperty.all(const Size(150, 40))
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.circle_outlined,
                          color: Color(0xff112D4E),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Complate', 
                          style: TextStyle(
                            fontFamily: 'Roboto', 
                            color: Color(0xff112D4E), 
                            fontSize: 14
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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