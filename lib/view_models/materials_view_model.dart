import 'dart:async';

import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/services/materials_service.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum CourseMaterialsState { none, loading, error }

class MaterialsViewModel with ChangeNotifier {
  final _dioService = MaterialDioService();
  CourseMaterialsState courseMaterialsState = CourseMaterialsState.none;

  Data modulsPreview = Data();
  Data modulsEnrolled = Data();
  String messageSubmit = '';
  bool? isCompleted;
  String? errorMessage = '';

  VideoPlayerController? controller;
  Future<void>? futureController;

  // List<MaterialsModel> get modules {
  //   return [..._materials];
  // }

  Future<void> playOrNot() async {
    controller!.value.isPlaying ? controller!.pause() : controller!.play();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  Future<void> getPreviewMaterialsModules(String courseId) async {
    courseMaterialsState = CourseMaterialsState.loading;
    await Future.delayed(const Duration(seconds: 1));
    try {
      final result = await _dioService.getPreviewModulesMaterials(courseId);
      modulsPreview = result;
      // print(moduls[0].materials!);
      courseMaterialsState = CourseMaterialsState.none;
    } catch (e) {
      courseMaterialsState = CourseMaterialsState.error;

      rethrow;
    }
    notifyListeners();
  }

  Future<void> getEnrolledMaterialsModules(
      String menteeId, String courseId) async {
    courseMaterialsState = CourseMaterialsState.loading;
    try {
      final result =
          await _dioService.getEnrolledModulesMaterials(menteeId, courseId);
      modulsEnrolled = Data();
      errorMessage = '';
      if (result == "502") {
        errorMessage = result;
      } else {
        errorMessage = '';
        modulsEnrolled = result;
      }
      courseMaterialsState = CourseMaterialsState.none;
    } catch (e) {
      courseMaterialsState = CourseMaterialsState.error;
      rethrow;
    }
    notifyListeners();
  }

  Future<void> submitProgress(
      String menteeId, String courseId, String materialId) async {
    try {
      final result =
          await _dioService.submitProgress(menteeId, courseId, materialId);
      messageSubmit = result;
      // print('berhasil menambahkan data $result');
      if (result == "Success add progress") {
        // print('berhasil');
        isCompleted = true;
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  void changeIsCompleted(bool isCourseCompleted) {
    isCompleted = isCourseCompleted;
    notifyListeners();
  }

  // Future<void> getDetailMaterials(String menteeId, String materialId) async {
  //   try {
  //     final result = await _dioService.getDetailMaterials(menteeId, materialId);
  //     moduls = result;
  //   } catch (e) {
  //     rethrow;
  //   }
  //   notifyListeners();
  // }
}
