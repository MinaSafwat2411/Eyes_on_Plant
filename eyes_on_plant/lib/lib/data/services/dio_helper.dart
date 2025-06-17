import 'dart:io';
import 'package:dio/dio.dart';

class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.4.34:5000/', // Ensure this is accessible from your device/emulator
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Response> postImage(File imageFile) async {
    String fileName = imageFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imageFile.path, filename: fileName),
    });

    try {
      Response response = await dio.post(
        'predict',
        data: formData,
      );
      return response;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
}
