import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../add_product/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
