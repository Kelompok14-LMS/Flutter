import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../utils/constant.dart';
import '../../view_models/assignment_view_model.dart';

class SoalScreen extends StatefulWidget {
  const SoalScreen({super.key});

  @override
  State<SoalScreen> createState() => _SoalScreenState();
}

class _SoalScreenState extends State<SoalScreen> {
  @override
  void initState() {
    Provider.of<AssignmentViewModel>(context, listen: false)
        .pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assignViewModel =
        Provider.of<AssignmentViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Soal',
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
      body: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        controller: assignViewModel.pdfViewerController,
        onDocumentLoadFailed: (details) => PdfDocumentLoadFailedDetails(
            'Opps, Gagal Memuat PDF', 'Pastikan Koneksi Internet Anda Stabil'),
      ),
    );
  }
}
