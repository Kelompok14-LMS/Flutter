import 'package:edu_world/view_models/certificate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReviewPDFCertificate extends StatefulWidget {
  const ReviewPDFCertificate({super.key});

  @override
  State<ReviewPDFCertificate> createState() => _ReviewPDFCertificateState();
}

class _ReviewPDFCertificateState extends State<ReviewPDFCertificate> {
  Future<void> openFile(String url) async {
    await OpenFilex.open(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sertifikat'),
        actions: [
          Consumer<CertificateViewModel>(builder: (context, value, _) {
            if (value.fileCertificate == null) {
              return Container();
            } else {
              return IconButton(
                  onPressed: () {
                    openFile(value.fileCertificate!.path);
                  },
                  icon: const Icon(Icons.info));
            }
          })
        ],
      ),
      body: Consumer<CertificateViewModel>(
        builder: (context, value, _) {
          if (value.certificateDownloadState ==
              CertificateDownloadState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (value.certificateDownloadState == CertificateDownloadState.none) {
            if (value.fileCertificate == null) {
              return const Center(
                child: Text('Tidak dapat mendownload sertifikat'),
              );
            } else {
              return SfPdfViewer.file(value.fileCertificate!,
                  enableDoubleTapZooming: true);
            }
          }
          return const Center(
              child: Text('ERROR, gagal mendownload sertifikat'));
        },
      ),
    );
  }
}
