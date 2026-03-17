import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/utils/backend_break_point.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/products_repo.dart';
import '../models/product_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendBreakPoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(message: "Failed to get product!"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendBreakPoint.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(message: "Failed to get product!"));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct({
    required ProductEntity productEntity,
    required String productCode,
  }) async {
    try {
      await databaseService.updateData(
        path: BackendBreakPoint.updateProducts,
        data: ProductModel.fromEntity(productEntity).toJson(),
      );
      return Right(null);
    } on Exception {
      return Left(ServerFailure(message: "حدث خطأ في عملية تحديث المنتج"));
    }
  }
}
