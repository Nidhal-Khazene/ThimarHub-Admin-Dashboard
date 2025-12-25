import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = "AddProductView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: AddProductViewBody(),
        ),
      ),
    );
  }
}
