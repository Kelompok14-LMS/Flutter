import 'package:edu_world/models/slide_materi_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SlideMateriScreen extends StatefulWidget {
  const SlideMateriScreen({super.key});

  @override
  State<SlideMateriScreen> createState() => _SlideMateriScreenState();
}

class _SlideMateriScreenState extends State<SlideMateriScreen>{
  // final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  late PdfViewerController _pdfViewerController;
  

  double topBarOpacity = 0.0;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
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
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF0C223D),),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SfPdfViewer.network(
                detailSlide[0].url!,
                controller: _pdfViewerController,
                scrollDirection: PdfScrollDirection.vertical,
              ),
            ),
            const Divider(
              color: Colors.transparent,
              height: 20,
            ),
            Text(
              detailSlide[0].material_id!,
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
              detailSlide[0].description!,
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: MaterialButton(
                minWidth: 373,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                onPressed: (){
                  // Navigator.of(context).push(PageRouteBuilder(
                  //   reverseTransitionDuration: const Duration(milliseconds: 500),
                  //   transitionDuration: const Duration(milliseconds: 500),
                  //   pageBuilder: (context, animation, secondaryAnimation) {
                  //   return const SlideMateriScreen();
                  // },
                  //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  //     final tween = Tween(
                  //     begin: const Offset(-1, 0),
                  //     end: Offset.zero,
                  //   );
                  //   return SlideTransition(
                  //     position: animation.drive(tween),
                  //     child: child,
                  //   );
                  // }),);
                },
                color: const Color(0xff112D4E),
                child: const Text('Selanjutnya', style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<SlideMateriModel> detailSlide = [
    SlideMateriModel(
      material_id: 'Latar Belakang Tugas',
      description: 'Pada peerusahaan, seorang UX Researcher perlu membuat persona untuk memperkirakan pain points, needs, dan kebutuhan seorang user. penting bagi intern untuk tahu konsep dari persona secara lebih detail',
      url: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
      type: '2',
    )
  ];

}