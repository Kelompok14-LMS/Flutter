import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_world/models/mentee_assignment_model.dart';
import 'package:edu_world/services/assignment_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AssignmentViewModel with ChangeNotifier {
  final AssignmentAPI assigntmentApi = AssignmentAPI();
  List<MenteeAssignmentModel> menteeAssignmentModel = [];

  PlatformFile? pickedFile;
  late FilePickerResult result;
  late String fileName;
  late File file;

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

  Future<void> uploadTugasPDF(context) async {
    try {
      await assigntmentApi.uploadTugas(
        formData: FormData.fromMap(
          {
            'assignmentUrl':
                await MultipartFile.fromFile(pickedFile!.path.toString())
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackbarr(e.toString()));
    }
    notifyListeners();
  }

  SnackBar snackbarr(String text) {
    return SnackBar(content: Text(text));
  }
}
