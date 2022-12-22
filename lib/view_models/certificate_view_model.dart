import 'dart:io';

import 'package:edu_world/services/certificate_service.dart';
import 'package:flutter/material.dart';

enum CertificateDownloadState { none, loading, error }

class CertificateViewModel extends ChangeNotifier {
  CertificateDownloadState certificateDownloadState =
      CertificateDownloadState.none;
  final _dioService = CertificateDioService();
  File? fileCertificate;
  bool isLoading = false;

  Future<File?> getCertificate(String menteeId, String courseId,
      String menteeName, String courseName) async {
    certificateDownloadState = CertificateDownloadState.loading;
    isLoading = true;
    try {
      final result = await _dioService.getCertificate(
          menteeId, courseId, menteeName, courseName);
      fileCertificate = result;
      certificateDownloadState = CertificateDownloadState.none;
      isLoading = false;
    } catch (e) {
      fileCertificate = File('');
      certificateDownloadState = CertificateDownloadState.error;
      isLoading = false;
    }
    notifyListeners();
    return null;
  }
}
