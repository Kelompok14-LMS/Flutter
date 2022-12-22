import 'dart:async';

import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/services/materials_service.dart';
import 'package:flutter/material.dart';

enum CourseMaterialsState { none, loading, error }

class MaterialsViewModel with ChangeNotifier {
  final _dioService = MaterialDioService();
  CourseMaterialsState courseMaterialsState = CourseMaterialsState.none;

  Data modulsPreview = Data();
  Data modulsEnrolled = Data();
  String messageSubmit = '';
  bool? isCompleted;
  String? errorMessage = '';
  // String? courseId = '';

  Future<void> getPreviewMaterialsModules(String courseId) async {
    courseMaterialsState = CourseMaterialsState.loading;
    try {
      final result = await _dioService.getPreviewModulesMaterials(courseId);
      modulsPreview = result;
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
    modulsEnrolled = Data();
    try {
      final result =
          await _dioService.getEnrolledModulesMaterials(menteeId, courseId);
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
      if (result == "Sukses menambahkan data") {
        isCompleted = true;
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  void changeIsCompleted(bool isCourseCompleted) async {
    isCompleted = isCourseCompleted;
    notifyListeners();
  }
}
