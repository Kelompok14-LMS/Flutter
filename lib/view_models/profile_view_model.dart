import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_world/core.dart';
import 'package:edu_world/services/profile_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProfileViewModel with ChangeNotifier {
  final ProfileAPI profileAPI = ProfileAPI();

  late TextEditingController nameController;
  late TextEditingController nomorTelpController;
  late TextEditingController tanggalLahirController;

  List<MenteesModel> mentees = [];
  MenteesModel? menteesModel;

  PlatformFile? pickedFile;
  late FilePickerResult result;
  late String fileName;
  late File file;

  Future<void> ambilFoto(context, String id) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      fileName = result.files.first.name;
      pickedFile = result.files.first;
      file = File(pickedFile!.path.toString());
      debugPrint(fileName);
      uploadImage(context, id);
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbarr('Berhasil Mengambil File $fileName'));
    }
    notifyListeners();
  }

  ///Update Data Profile
  Future editProfile(context, id) async {
    try {
      await profileAPI.updateProfile(menteesModel = MenteesModel(
        id: id,
        fullname: nameController.text,
        phone: nomorTelpController.text,
        birthDate: tanggalLahirController.text,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackbarr(e.toString()));
    }
    notifyListeners();
  }

  ///Upload Foto
  Future uploadImage(context, String id) async {
    try {
      await profileAPI.uploadFoto(
        id,
        formData: FormData.fromMap(
          {
            'image_file': await MultipartFile.fromFile(
              pickedFile!.path.toString(),
            ),
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackbarr(e.toString()));
    }
    notifyListeners();
  }

  ///Get Data Profile
  Future getProfile(context) async {
    try {
      mentees = await profileAPI.getDataProfile();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackbarr(e.toString()));
    }
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    nomorTelpController.dispose();
    tanggalLahirController.dispose();
    super.dispose();
  }

  SnackBar snackbarr(String text) {
    return SnackBar(content: Text(text));
  }
}
