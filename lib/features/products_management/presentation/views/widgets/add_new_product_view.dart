import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/core/repositories/images_repo.dart';
import 'package:ecommerce_app_dashboard/core/repositories/product_repo.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/manager/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/add_new_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocProvider(
            create: (context) => AddProductCubit(
              imagesRepo: getIt<ImagesRepo>(),
              productRepo: getIt<ProductRepo>(),
            ),
            child: AddNewProductViewBody(),
          ),
        ),
      ),
    );
  }
}
