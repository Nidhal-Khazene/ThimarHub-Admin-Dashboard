import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/core/repositories/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File fileImage) {
    // TODO: implement upload
    throw UnimplementedError();
  }
}
