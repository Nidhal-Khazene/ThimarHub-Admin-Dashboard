import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/add_new_product_view.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/products_management_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/products_repo.dart';

class ProductsManagementView extends StatelessWidget {
  const ProductsManagementView({super.key});

  static const routeName = "products_management_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewProductView.routeName);
        },
        elevation: 0,
        backgroundColor: ColorsData.kPrimaryColor,
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
      appBar: buildAppBar(title: "المنتجات", context: context),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: BlocProvider(
            create: (context) => ProductsCubit(getIt<ProductsRepo>()),
            child: ProductsManagementViewBody(),
          ),
        ),
      ),
    );
  }
}
