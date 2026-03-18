import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage(File fileImage);
  Future<Either<Failure, void>> updateImage(File fileImage);
}
