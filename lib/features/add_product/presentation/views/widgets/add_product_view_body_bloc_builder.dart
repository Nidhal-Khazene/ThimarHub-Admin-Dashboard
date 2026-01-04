import 'package:ecommerce_app_dashboard/core/helper/show_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: Scaffold(
            body: Center(child: CustomLoadingIndicator()),
          ),
          opacity: 0,
          inAsyncCall: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
      listener: (context, state) {
        if (state is AddProductFailure) {
          showSnackBar(context, "Fail to add Product");
        }
        if (state is AddProductSuccess) {
          showSnackBar(context, "Success adding the Product");
        }
      },
    );
  }
}
