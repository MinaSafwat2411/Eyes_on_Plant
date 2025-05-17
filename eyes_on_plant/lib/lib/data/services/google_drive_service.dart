import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class GoogleDriveUploader {
  final String serviceAccountJsonPath =
      'assets/drive/eyes-on-plants-458321-a59037e0f1fa.json';
  final String folderId = '1eFAM9KiN0_E9rNyG7IE2Id4zJEohHt1J';

  Future<AuthClient?> _getAuthClient() async {
    final jsonString = await rootBundle.loadString(serviceAccountJsonPath);
    final credentials =
        ServiceAccountCredentials.fromJson(json.decode(jsonString));

    return await clientViaServiceAccount(
        credentials, [drive.DriveApi.driveFileScope]);
  }

  Future<String?> uploadImageToDrive() async {
    final authClient = await _getAuthClient();
    if (authClient == null) return null;

    final driveApi = drive.DriveApi(authClient);

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.values.elementAt(0));
    if (pickedFile == null) return null;

    File imageFile = File(pickedFile.path);
    var media = drive.Media(imageFile.openRead(), imageFile.lengthSync());

    var driveFile = drive.File()
      ..name = 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg'
      ..parents = [folderId];

    final uploadedFile =
        await driveApi.files.create(driveFile, uploadMedia: media);

    await driveApi.permissions.create(
      drive.Permission(type: "anyone", role: "reader"),
      uploadedFile.id!,
    );

    return "https://drive.google.com/uc?export=view&id=${uploadedFile.id}";
  }

  void deleteFile(String fileId) async {
    final authClient = await _getAuthClient();
    if (authClient == null) return;
    final driveApi = drive.DriveApi(authClient);
    await driveApi.files.delete(fileId);
  }
}
