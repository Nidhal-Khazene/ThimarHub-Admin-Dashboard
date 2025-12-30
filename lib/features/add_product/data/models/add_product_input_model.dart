import 'dart:io';

import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName, productCode, productDescription;
  String? urlImage;
  final num productPrice;
  final File fileImage;
  final bool isFeatured;

  AddProductInputModel({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    this.urlImage,
    required this.productPrice,
    required this.fileImage,
    required this.isFeatured,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      productName: addProductInputEntity.productName,
      productCode: addProductInputEntity.productCode,
      productDescription: addProductInputEntity.productDescription,
      productPrice: addProductInputEntity.productPrice,
      fileImage: addProductInputEntity.fileImage,
      isFeatured: addProductInputEntity.isFeatured,
    );
  }
  toJson() {
    return {
      "productName": productName,
      "productCode": productCode,
      "productDescription": productDescription,
      "productPrice": productPrice,
      "fileImage": fileImage,
      "isFeatured": isFeatured,
    };
  }
}
