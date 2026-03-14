import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/add_new_product_view_body.dart';
import 'package:flutter/material.dart';

class AddNewProductView extends StatelessWidget {
  const AddNewProductView({super.key});
  static const String routeName = "AddNewProductView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "اضافه صنف جديد"),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: AddNewProductViewBody(),
        ),
      ),
    );
  }
}
