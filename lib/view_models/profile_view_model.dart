import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:edu_world/services/profile_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/mentees.dart';
import '../utils/finite_state.dart';
import '../view/main_view.dart';

enum ProfileState { none, loading, loaded, error }

class ProfileViewModel with ChangeNotifier {
  final ProfileAPI profileAPI = ProfileAPI();
  ProfileState profileState = ProfileState.none;
  late TextEditingController nameController;
  late TextEditingController nomorTelpController;
  late TextEditingController tanggalLahirController;

  MenteesModel? mentees;
  ViewState viewState = ViewState.none;
  PlatformFile? pickedFile;
  late FilePickerResult result;
  late String fileName;
  File? file;
  String percent = '';

  ///For Finite State
  void changeState(ProfileState state) {
    profileState = state;
    notifyListeners();
  }

  ///Get Data Profile
  Future getProfile(context) async {
    changeState(ProfileState.loading);
    try {
      final result = await profileAPI.getDataProfile();
      mentees = result;
      changeState(ProfileState.loaded);
    } catch (e) {
      debugPrint(e.toString());
      changeState(ProfileState.error);
    }
    notifyListeners();
  }

  /// Pick Picture
  Future<void> ambilFoto(context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );
      changeState(ProfileState.loading);
      if (result != null) {
        fileName = result.files.first.name;
        pickedFile = result.files.first;
        file = File(pickedFile!.path.toString());
        debugPrint(fileName);
        await updatePic(context);
        changeState(ProfileState.loaded);
      }
    } catch (e) {
      changeState(ProfileState.error);
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  ///Update Profile
  Future updateProfile(context) async {
    changeStatee(ViewState.loading);
    try {
      final result = await profileAPI.updateProfile(
        formData: FormData.fromMap(
          {
            'fullname': nameController.text,
            'phone': nomorTelpController.text,
            'birth_date': tanggalLahirController.text,
          },
        ),
        onSendProgress: (int count, int total) {
          percent =
              'Progress Send ${(count / total * 100).toStringAsFixed(0)} %';
        },
      );
      changeStatee(ViewState.none);
      debugPrint(percent);
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => const MainScreen(),
          ),
          ((route) => false));
      debugPrint(result);
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbarr('Berhasil Update Profile'));
    } catch (e) {
      debugPrint(e.toString());
      changeStatee(ViewState.error);
    }
    notifyListeners();
  }

  ///Upload Picture
  Future updatePic(context) async {
    changeState(ProfileState.loading);
    try {
      final result = await profileAPI.updateProfile(
        formData: FormData.fromMap(
          {
            'profile_picture': await MultipartFile.fromFile(
              pickedFile!.path.toString(),
            ),
          },
        ),
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
      ScaffoldMessenger.of(context).showSnackBar(
        snackbarr('Berhasil Update Foto'),
      );
      changeState(ProfileState.loaded);
      debugPrint(percent);
      debugPrint(result.toString());
    } catch (e) {
      debugPrint(e.toString());
      changeState(ProfileState.error);
    }
    notifyListeners();
  }

  /// Date Picker
  Future<void> showDate(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final pilihTanggal = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2024));
    final hasil = DateFormat('dd MMMM yyyy').format(pilihTanggal!);
    tanggalLahirController.text = hasil.toString();
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    nomorTelpController.dispose();
    tanggalLahirController.dispose();
    super.dispose();
  }

  /// Display Pic for New User(Because Default at Registration Pic is Empty)
  final String imageProfileDefault = "https://i.ibb.co/QbrkBY8/Ellipse-6.png";

  /// For Show Something onScreen
  SnackBar snackbarr(String text) {
    return SnackBar(content: Text(text));
  }

  ///For Button
  void changeStatee(ViewState statee) {
    viewState = statee;
    notifyListeners();
  }
}
