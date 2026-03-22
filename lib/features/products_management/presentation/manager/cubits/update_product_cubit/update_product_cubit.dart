import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/repos/images_repo.dart';
import 'package:meta/meta.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit(this.imagesRepo) : super(UpdateProductInitial());
  final ImagesRepo imagesRepo;

  Future<void> updateProduct({
    required File fileImage,
    required String imagePath,
  }) async {
    emit(UpdateProductLoading());
    final result = await imagesRepo.updateImage(
      fileImage: fileImage,
      imagePath: imagePath,
    );
    result.fold(
      (failure) => emit(UpdateProductFailure(errMessage: failure.message)),
      (_) => emit(UpdateProductSuccess()),
    );
  }
}
