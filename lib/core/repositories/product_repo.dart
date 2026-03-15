import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, Unit>> addProduct(ProductEntity addProductInputEntity);
}
