import 'dart:io';

import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseCloudStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File fileImage) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
