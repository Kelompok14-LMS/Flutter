import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignmentAPI {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://stagging.educatetheworld.tech/api/v1',
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));

  AssignmentAPI() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final share = await SharedPreferences.getInstance();
          final token = share.getString('token');
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
  }

  ///Upload PDF
  Future uploadTugas(
      {required FormData formData,
      required Function(int, int)? onSendProgress}) async {
    try {
      final Response response = await dio.post(
        '/mentee-assignments',
        onReceiveProgress: onSendProgress,
        data: formData,
      );
      debugPrint(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      return debugPrint(e.message);
    }
  }
}
