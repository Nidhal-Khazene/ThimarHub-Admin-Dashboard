import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/entities/product_entity.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/repos/images_repo.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/manager/cubits/update_product_cubit/update_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_product_information_view_bloc_builder.dart';

class EditProductInformationView extends StatelessWidget {
  const EditProductInformationView({super.key, required this.productEntity});

  static const routeName = "EditProductInformationView";
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: "تعديل بيانات صنف",
        leading: IconButton(
          padding: EdgeInsets.only(right: 8),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: BlocProvider(
            create: (context) => UpdateProductCubit(getIt<ImagesRepo>()),
            child: EditProductViewBlocBuilder(productEntity: productEntity),
          ),
        ),
      ),
    );
  }
}
