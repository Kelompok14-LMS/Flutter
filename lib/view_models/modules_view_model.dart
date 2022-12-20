// import 'package:edu_world/models/modules_model.dart';
// import 'package:edu_world/services/modules_service.dart';
// import 'package:flutter/material.dart';

// class ModulesViewModel with ChangeNotifier{

//   List<ModulesModel> _modules = [];
    
//   List<ModulesModel> get modules {
//     return [..._modules];
//   }
  
//   Future<void> getModules() async {
//     try {
//       final result = await ModulesAPI().getModules();
//       _modules = result;
//       notifyListeners();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }