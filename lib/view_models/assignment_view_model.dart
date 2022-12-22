import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:edu_world/services/assignment_service.dart';
import 'package:edu_world/utils/finite_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignmentViewModel with ChangeNotifier {
  final AssignmentAPI assigntmentApi = AssignmentAPI();
  ViewState viewState = ViewState.none;

  PlatformFile? pickedFile;
  late FilePickerResult result;
  late String fileName;
  File? file;
  String percent = '';

  void changeStatee(ViewState statee) {
    viewState = statee;
    notifyListeners();
  }

  Future<void> ambilFile(context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      fileName = result.files.first.name;
      pickedFile = result.files.first;
      file = File(pickedFile!.path.toString());
      debugPrint(fileName);
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbarr('Berhasil Mengambil File $fileName'));
    }
    notifyListeners();
  }

  void changeStateAfterSendFile() {
    viewState = ViewState.none;
    notifyListeners();
  }

  Future<void> uploadTugasPDF(context, {required String assignmentId}) async {
    final share = await SharedPreferences.getInstance();
    final token = share.getString('token');
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    final menteeId = payload['mentee_id'];

    try {
      changeStatee(ViewState.loading);
      await assigntmentApi.uploadTugas(
        formData: FormData.fromMap({
          'mentee_id': menteeId,
          'assignment_id': assignmentId,
          'pdf': await MultipartFile.fromFile(pickedFile!.path.toString())
        }),
        onSendProgress: (int count, int total) {
          if (count <= 0) return "0 B";
          const suffixes = [
            "B",
            "KB",
            "MB",
          ];
          final i = (log(count) / log(1024)).floor();
          percent =
              'Uploading ${(count / pow(1024, i)).toStringAsFixed(0)} ${suffixes[i]} of ${(total / pow(1024, i)).toStringAsFixed(0)} ${suffixes[i]} - ${(count / total * 100).toStringAsFixed(0)} %';

          notifyListeners();
        },
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbarr('Berhasil Mengirim Tugas'));
      changeStatee(ViewState.loaded);
      debugPrint(payload['mentee_id']);
      debugPrint(assignmentId);
      debugPrint(percent);
    } catch (e) {
      debugPrint(e.toString());
      changeStatee(ViewState.error);
    }
    notifyListeners();
  }

  SnackBar snackbarr(String text) {
    return SnackBar(content: Text(text));
  }
}
