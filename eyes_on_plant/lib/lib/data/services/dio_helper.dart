import 'dart:io';
import 'package:dio/dio.dart';


class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://194.163.136.200:5000/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  static Future<Response> postImage(File imageFile) async {
    String fileName = imageFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path, filename: fileName),
    });
    try {
      Response response = await dio.post(
        'predict',
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      throw Exception('Error uploading image: ${e.response?.data}');
    }
  }
}
