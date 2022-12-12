import 'package:dio/dio.dart';
import 'package:edu_world/models/materials_model.dart';

class MaterialsAPI {
  
  static const baseURL = 'http://educatetheworld.tech/api/v1/materials/:materialId';
  late Dio _dio;

  MaterialsAPI() {
    _dio = Dio();
  }

  Future<List<MaterialsModel>> getMaterials() async {
    try {
      final response = await _dio.get(baseURL);
      List<MaterialsModel> dataMaterials = response.data['data'];
      return dataMaterials;
    } catch (e) {
      rethrow;
    }
  }
}