import 'dart:io';

import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FirebaseCloudStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<Map<String, String>> uploadFile(File file, String path) async {
    final fileName = p.basename(file.path);

    final fileRef = storageRef.child("$path/$fileName");

    await fileRef.putFile(file, SettableMetadata(contentType: 'image/jpeg'));
    final url = await fileRef.getDownloadURL();
    final imagePath = fileRef.fullPath;

    return {"url": url, "imagePath": imagePath};
  }

  @override
  Future<void> updateFile(File file, String path) {
    // TODO: implement updateFile
    throw UnimplementedError();
  }
}
