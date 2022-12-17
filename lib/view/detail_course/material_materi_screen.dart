// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edu_world/view/detail_course/components/fitur_playback_material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:edu_world/models/course_model.dart';
import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';

class VideoMateriScreen extends StatefulWidget {
  const VideoMateriScreen({
    Key? key,
    required this.courseModel,
    required this.materials,
    required this.mentee,
  }) : super(key: key);
  final CourseModel courseModel;
  final Materials materials;
  final String mentee;

  @override
  State<VideoMateriScreen> createState() => _VideoMateriScreenState();
}

class _VideoMateriScreenState extends State<VideoMateriScreen> {
  late VideoPlayerController controller;
  late Future<void> futureController;
  // late bool isCourseCompleted = widget.materials.completed!;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.materials.url!)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => controller.play());
    controller.setLooping(true);
    futureController = controller.initialize();

    // Provider.of<MaterialsViewModel>(context, listen: false)
    //     .getPreviewMaterialsModules(widget.courseModel.id!);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final dataMaterials = Provider.of<MaterialsViewModel>(context);

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
          widget.materials.title!,
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
                height: 200,
                width: 500,
                child: Stack(
                  children: <Widget> [
                    FutureBuilder(
                      future: futureController,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator()
                          );
                        }
                      }
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              shadowColor: MaterialStateProperty.all(Colors.transparent)
                            ),
                            onPressed: () {
                              setState(() {
                                controller.value.isPlaying
                                    ? controller.pause()
                                    : controller.play();
                              });
                            },
                            child: Icon(
                              controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                        ),
                        ControlMaterialVideo(controller: controller),
                        VideoProgressIndicator(controller, allowScrubbing: true),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.transparent,
                height: 20,
              ),
              Text(
                widget.materials.title!,
                style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff112D4E)),
              ),
              const Divider(
                color: Colors.transparent,
                height: 10,
              ),
              Text(
                widget.materials.description!,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff112D4E),
                  height: 1.5,
                ),
              ),
              // const Divider(
              //   color: Colors.transparent,
              //   height: 300,
              // ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (!widget.materials.completed!) {
                      Provider.of<MaterialsViewModel>(context, listen: false)
                          .submitProgress(widget.mentee, widget.courseModel.id!,
                              widget.materials.materialId!);
                      // Provider.of<MaterialsViewModel>(context)
                      //     .changeIsCompleted(true);
                      print('aneh');
                    } else {
                      print('gagal');
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Color(0xFFE4B548)),
                      maximumSize:
                          MaterialStateProperty.all(const Size(150, 40))),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !widget.materials.completed!
                          ? const Icon(
                              Icons.circle_outlined,
                              color: Color(0xff112D4E),
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: const [
                                Positioned(
                                  child: Icon(
                                    Icons.circle_outlined,
                                    color: Color(0xff112D4E),
                                    size: 20,
                                  ),
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Color(0xff112D4E),
                                  size: 11,
                                ),
                              ],
                            ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Complete',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff112D4E),
                            fontSize: 14),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
