import 'package:edu_world/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_models/assignment_view_model.dart';

class TugasScreen extends StatelessWidget {
  const TugasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assignmentViewModel =
        Provider.of<AssignmentViewModel>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tugas',
          style: GoogleFonts.roboto(color: MyColor.primary),
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
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(22.5),
            child: Text(
              'Di akhir minggu pertama, teman teman telah mempelajari terkait apa itu Design Thinking, dimana ini merupakan framework yang paling sering digunakan dalam menerapkan konsep UI UX. Nah untuk meningkatkan dan melatih pemahaman teman - teman terkait Design Thinking',
              textAlign: TextAlign.justify,
              style: GoogleFonts.roboto(fontSize: 14, color: MyColor.primary),
              overflow: TextOverflow.ellipsis,
              maxLines: 17,
            ),
          ),
          SizedBox(
            height: media.height * 0.01,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: media.width * 0.01,
                right: media.width * 0.45,
              ),
              child: Text(
                'Kerjakan Soal Berikut',
                style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: MyColor.primary),
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.01,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: media.width * 0.06,
                right: media.width * 0.48,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Jumlah Soal',
                    style: GoogleFonts.roboto(
                        color: MyColor.primary, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      ': 5 Essay ',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: MyColor.primary,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: media.width * 0.06,
                right: media.width * 0.48,
                top: media.height * 0.006,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Tipe Soal',
                    style: GoogleFonts.roboto(
                        color: MyColor.primary, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Text(
                      ': Essay',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: MyColor.primary,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: media.width * 0.06,
                right: media.width * 0.48,
                top: media.height * 0.006,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Status',
                    style: GoogleFonts.roboto(
                        color: MyColor.primary, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Text(
                      ': Belum Dinilai ',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: MyColor.primary,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: media.width * 0.06,
                right: media.width * 0.48,
                top: media.height * 0.006,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Nilai ',
                    style: GoogleFonts.roboto(
                        color: MyColor.primary, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Text(
                      ': 0',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: MyColor.primary,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.03,
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 22.5, right: 22.5),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFB8C0CA),
                      borderRadius: BorderRadius.circular(8)),
                  height: 70,
                  width: 380,
                  child: Center(
                    child: Text(
                      'Lihat Soal',
                      style: GoogleFonts.roboto(color: MyColor.primary),
                    ),
                  )),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: media.height * 0.05,
          ),
          Consumer<AssignmentViewModel>(
            builder: (context, value, child) => value.pickedFile != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 22.5, right: 22.5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFB8C0CA),
                          borderRadius: BorderRadius.circular(8)),
                      height: 162,
                      width: 380,
                      //child: SfPdfViewer.file(value.file),
                    ),
                  )
                : InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22.5, right: 22.5),
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFB8C0CA),
                              borderRadius: BorderRadius.circular(8)),
                          height: 162,
                          width: 380,
                          child: const Center(child: Icon(Icons.upload))),
                    ),
                    onTap: () {
                      assignmentViewModel.ambilFile(context);
                    },
                  ),
          ),
          SizedBox(
            height: media.height * 0.1,
          ),
          InkWell(
            child: Container(
              width: 373,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MyColor.primary,
              ),
              child: const Center(
                child: Text(
                  'Unggah',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            onTap: () {
              assignmentViewModel.uploadTugasPDF(context);
            },
          ),
        ],
      ),
    );
  }
}
