import 'dart:io';

import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: 'https://stagging.educatetheworld.tech',
  ),
);

class CertificateDioService {
  CertificateDioService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Send Headers
          final share = await SharedPreferences.getInstance();
          final token = share.getString('token');
          options.headers['Authorization'] = 'Bearer $token';
          // options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
  }
  double progress = 0;

  Future<File?> getCertificate(String menteeId, String courseId,
      String menteeName, String courseName) async {
    try {
      dynamic response = await _dio.get(
          '/api/v1/mentees/$menteeId/courses/$courseId/certificate',
          options: Options(responseType: ResponseType.bytes));
      if (response != null) {
        var status = await Permission.storage.request();
        if (status.isGranted) {
          final Directory? appDir = Platform.isAndroid
              ? await getExternalStorageDirectory()
              : await getApplicationDocumentsDirectory();
          String tempPath = appDir!.path;
          final String fileName =
              "$menteeName-${courseName.replaceAll('/', '')}.pdf";
          File file = File('$tempPath/$fileName');
          if (!await file.exists()) {
            await file.create();
          }
          await file.writeAsBytes(response.data);
          return file;
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
