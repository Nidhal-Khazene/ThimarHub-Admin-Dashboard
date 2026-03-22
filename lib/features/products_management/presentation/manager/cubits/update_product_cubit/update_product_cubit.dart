import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/repos/images_repo.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/repos/products_repo.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit({required this.imagesRepo, required this.productRepo})
    : super(UpdateProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productRepo;

  Future<void> updateProduct({
    required ProductEntity addProductInputEntity,
    required File fileImage,
    required String imagePath,
  }) async {
    emit(UpdateProductLoading());
    final imageResult = await imagesRepo.updateImage(
      fileImage: fileImage,
      imagePath: imagePath,
    );
    imageResult.fold(
      (failure) => emit(UpdateProductFailure(errMessage: failure.message)),
      (_) async {
        final productResult = await productRepo.updateProduct(
          productEntity: addProductInputEntity,
          productCode: addProductInputEntity.productCode,
        );
        productResult.fold(
          (failure) => emit(UpdateProductFailure(errMessage: failure.message)),
          (_) => emit(UpdateProductSuccess()),
        );
      },
    );
  }
}
