import 'package:edu_world/view/components/skeleton.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController:
          VideoPlayerController.network(widget.materials.url!),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<MaterialsViewModel>(context, listen: false)
          .changeIsCompleted(widget.materials.completed!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    flickManager!.dispose();
    flickManager = null;
  }

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
              Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: FlickVideoPlayer(flickManager: flickManager!),
                  ),
                ],
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
              const SizedBox(
                height: 50,
              ),
              Consumer<MaterialsViewModel>(
                builder: (context, value, _) {
                  if (value.courseMaterialsState ==
                      CourseMaterialsState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (value.courseMaterialsState == CourseMaterialsState.none) {
                    if (value.isCompleted == null) {
                      return Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade500,
                          loop: 3,
                          child: const Skeleton(
                            height: 50,
                            width: 140,
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (!value.isCompleted!) {
                              await value.submitProgress(
                                  widget.mentee,
                                  widget.courseModel.id!,
                                  widget.materials.materialId!);
                              if (!mounted) return;
                              value.getEnrolledMaterialsModules(
                                  widget.mentee, widget.courseModel.id!);
                            } else {
                              debugPrint('gagal menambahkan data');
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Color(0xFFE4B548)),
                              maximumSize: MaterialStateProperty.all(
                                  const Size(150, 40))),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                !value.isCompleted!
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
                            ),
                          )),
                    );
                  } else {
                    return const Text('tidak ada data');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
