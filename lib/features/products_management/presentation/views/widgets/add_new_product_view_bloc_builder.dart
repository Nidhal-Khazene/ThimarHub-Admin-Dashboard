import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper/show_snack_bar.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/cubits/create_product_cubit/add_product_cubit.dart';
import 'add_new_product_view_body.dart';

class AddNewProductViewBlocBuilder extends StatelessWidget {
  const AddNewProductViewBlocBuilder({super.key});

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
          child: AddNewProductViewBody(),
        );
      },
      listener: (context, state) {
        if (state is AddProductSuccess) {
          showSnackBar(context, "تمت عملية إضافة المنتج بنجاح");
        }
        if (state is AddProductFailure) {
          showSnackBar(context, "فشل عملية إضافة المنتج");
        }
      },
    );
  }
}
