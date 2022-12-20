// import 'package:dio/dio.dart';
// import 'package:edu_world/models/modules_model.dart';

// class ModulesAPI {
//   static const baseURL =
//       'https://stagging.educatetheworld.tech/api/v1/modules/:moduleId';
//   late Dio _dio;

//   ModulesAPI() {
//     _dio = Dio();
//   }

//   Future<List<ModulesModel>> getModules() async {
//     try {
//       final response = await _dio.get(baseURL);
//       List<ModulesModel> dataModules = response.data['data'];
//       return dataModules;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
