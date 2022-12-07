import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AssignmentAPI {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));

  ///Upload PDF
  Future<void> uploadTugas({required FormData formData}) async {
    try {
      final response = await dio.post(
        'http://192.168.141.239/api/assignment/upload.php',
        data: formData,
      );
      debugPrint(response.data);
    } on DioError catch (e) {
      return debugPrint(e.message);
    }
  }
}
