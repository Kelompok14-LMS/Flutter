import 'package:edu_world/models/materials_model.dart';
import 'package:edu_world/services/materials_service.dart';
import 'package:flutter/material.dart';

class MaterialsViewModel with ChangeNotifier{

  List<MaterialsModel> _materials = [];
    
  List<MaterialsModel> get modules {
    return [..._materials];
  }
  
  Future<void> getModules() async {
    try {
      final result = await MaterialsAPI().getMaterials();
      _materials = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}