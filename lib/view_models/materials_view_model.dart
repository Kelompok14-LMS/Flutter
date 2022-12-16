import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/services/materials_service.dart';
import 'package:flutter/material.dart';

class MaterialsViewModel with ChangeNotifier {
  final _dioService = MaterialDioService();

  List<Modules> moduls = [];

  // List<MaterialsModel> get modules {
  //   return [..._materials];
  // }

  Future<void> getPreviewMaterialsModules(String courseId) async {
    try {
      final result = await _dioService.getPreviewModulesMaterials(courseId);
      moduls = result;
      // print(moduls[0].materials!);
    } catch (e) {
      rethrow;
    }
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
