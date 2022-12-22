import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/finite_state.dart';
import '../../view_models/assignment_view_model.dart';

class TugasScreen extends StatelessWidget {
  const TugasScreen(
      {super.key, required this.assignmentId, required this.dataMaterials});

  final String assignmentId;
  final Data dataMaterials;
  @override
  Widget build(BuildContext context) {
    final assignmentViewModel =
        Provider.of<AssignmentViewModel>(context, listen: false);
    final dataMaterialsProv =
        Provider.of<MaterialsViewModel>(context, listen: false);
    final dataEnrolled = Provider.of<EnrollViewModel>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Kembali',
          style: GoogleFonts.roboto(
              color: MyColor.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: Row(
          children: <Widget>[
            Flexible(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: MyColor.primary,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: const Color(0x00f9f7f7),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.only(
                left: media.width * 0.07,
                right: media.width * 0.5,
              ),
              child: Text(
                'Assignment',
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: MyColor.primaryLogo,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  left: media.width * 0.06,
                  right: media.width * 0.62,
                ),
                child: Text(
                  'Resume',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyColor.primary),
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: media.width * 0.07,
                right: media.width * 0.01,
              ),
              child: Text(
                'Sebagai syarat kelulusan kursus, kamu diminta untuk membuat resume singkat materi dari seluruh section.',
                style: GoogleFonts.roboto(
                    color: MyColor.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            SizedBox(
              height: media.height * 0.035,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: media.height * 0.03,
                right: media.height * 0.045,
              ),
              child: Container(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: MyColor.primaryLogo,
                    spreadRadius: 1,
                  )
                ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                height: 182,
                width: 356,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Consumer<AssignmentViewModel>(
                      builder: (context, value, child) => value.file != null
                          ? InkWell(
                              child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: MyColor.primary,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                height: 35,
                                width: 270,
                                child: Center(
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton.icon(
                                        icon: const Icon(
                                          Icons.insert_drive_file,
                                          color: MyColor.primaryLogo,
                                        ),
                                        label: Text(
                                          value.fileName,
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: MyColor.primary),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        onPressed: () async {
                                          await value.ambilFile(context);
                                        },
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Colors.transparent,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              onTap: () async {
                                await value.ambilFile(context);
                              },
                            )
                          : InkWell(
                              child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: MyColor.primary,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                height: 35,
                                width: 270,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton.icon(
                                      icon: const Icon(
                                        Icons.upload,
                                        color: MyColor.primaryLogo,
                                      ),
                                      label: Text(
                                        'Unggah',
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black38),
                                      ),
                                      onPressed: () async {
                                        await value.ambilFile(context);
                                      },
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                await value.ambilFile(context);
                              },
                            ),
                    ),
                    const SizedBox(height: 1),
                    Consumer<AssignmentViewModel>(
                      builder: (context, value, child) {
                        if (value.viewState == ViewState.loading) {
                          return Column(
                            children: <Widget>[
                              const Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: MyColor.primaryLogo,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                'Sedang Mengupload Tugas',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: MyColor.primary),
                              ),
                            ],
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 18, top: 18),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              child: Container(
                                height: 40,
                                width: 82,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: MyColor.primaryLogo,
                                ),
                                child: Center(
                                  child: Text(
                                    'Kirim',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: MyColor.primary),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                await assignmentViewModel.uploadTugasPDF(
                                    context,
                                    assignmentId: assignmentId);
                                Provider.of<MaterialsViewModel>(context,
                                        listen: false)
                                    .getEnrolledMaterialsModules(
                                        dataEnrolled.mentee!,
                                        dataMaterials.courseId!);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.35,
            ),
            Consumer<AssignmentViewModel>(
              builder: (context, value, child) => value.viewState ==
                      ViewState.loaded
                  ? InkWell(
                      child: Container(
                        width: 178,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColor.primaryLogo,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Selesai',
                              style: GoogleFonts.roboto(
                                  color: MyColor.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.check_circle),
                          ],
                        ),
                      ),
                      onTap: () {
                        Provider.of<MaterialsViewModel>(context, listen: false)
                            .getEnrolledMaterialsModules(
                                dataEnrolled.mentee!, dataMaterials.courseId!);
                        Provider.of<AssignmentViewModel>(context, listen: false)
                            .changeStateAfterSendFile();
                        Navigator.of(context).pop();
                      },
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
