import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/core/repositories/images_repo.dart';
import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:ecommerce_app_dashboard/core/utils/backend_break_point.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failure, Map<String, String>>> uploadImage(
    File fileImage,
  ) async {
    try {
      Map<String, String> imageInformation = await storageService.uploadFile(
        fileImage,
        BackendBreakPoint.images,
      );
      return Right(imageInformation);
    } on Exception catch (_) {
      return Left(ServerFailure(message: "فشل رفع الصورة!"));
    }
  }

  @override
  Future<Either<Failure, void>> updateImage({
    required File fileImage,
    required String imagePath,
  }) async {
    try {
      await storageService.updateFile(fileImage, imagePath);
      return right(null);
    } on Exception {
      return left(ServerFailure(message: "فشل تحديث الصورة!"));
    }
  }
}
