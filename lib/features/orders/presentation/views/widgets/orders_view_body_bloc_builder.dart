import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/cubits/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'orders_view_body.dart';

class OrderViewBodyBlocBuilder extends StatelessWidget {
  const OrderViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody();
        } else if (state is FetchOrdersFailure) {
          return CustomErrorWidget(text: state.errorMessage);
        } else {
          return Skeletonizer(child: OrdersViewBody());
        }
      },
    );
  }
}
