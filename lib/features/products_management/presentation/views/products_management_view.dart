import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/products_management_view_body.dart';
import 'package:flutter/material.dart';

class ProductsManagementView extends StatelessWidget {
  const ProductsManagementView({super.key});

  static const routeName = "products_management_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "المنتجات",
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: ProductsManagementViewBody(),
        ),
      ),
    );
  }
}
