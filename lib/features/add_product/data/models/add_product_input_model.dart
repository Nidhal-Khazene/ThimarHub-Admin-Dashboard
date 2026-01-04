import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final bool isFeatured;
  final String? urlImage; // store URL only

  AddProductInputModel({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.isFeatured,
    this.urlImage,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      productName: entity.productName,
      productCode: entity.productCode,
      productDescription: entity.productDescription,
      productPrice: entity.productPrice,
      isFeatured: entity.isFeatured,
      urlImage: entity.urlImage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "productCode": productCode,
      "productDescription": productDescription,
      "productPrice": productPrice,
      "isFeatured": isFeatured,
      "urlImage": urlImage,
    };
  }
}
