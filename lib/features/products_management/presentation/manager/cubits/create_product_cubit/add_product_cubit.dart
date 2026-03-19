import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/core/repositories/images_repo.dart';
import 'package:ecommerce_app_dashboard/core/repositories/product_repo.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productRepo})
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());

    final imageResult = await imagesRepo.uploadImage(
      addProductInputEntity.fileImage!,
    );

    await imageResult.fold(
      (failure) async {
        emit(AddProductFailure(errMessage: failure.message));
      },
      (imageInformation) async {
        addProductInputEntity.urlImage = imageInformation["url"];
        addProductInputEntity.imagePath = imageInformation["imagePath"];

        final productResult = await productRepo.addProduct(
          addProductInputEntity,
        );

        productResult.fold(
          (failure) {
            emit(AddProductFailure(errMessage: failure.message));
          },
          (_) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
