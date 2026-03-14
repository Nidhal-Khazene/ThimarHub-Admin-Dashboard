import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/edit_product_information_view_body.dart';
import 'package:flutter/material.dart';

class EditProductInformationView extends StatelessWidget {
  const EditProductInformationView({super.key, required this.productEntity});
  static const routeName = "EditProductInformationView";
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "تعديل بيانات صنف"),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: EditProductInformationViewBody(productEntity: productEntity),
        ),
      ),
    );
  }
}
