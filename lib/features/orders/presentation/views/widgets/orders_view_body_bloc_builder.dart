import 'package:ecommerce_app_dashboard/core/helper/get_dummy_order.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/update_order_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/cubits/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'orders_view_body.dart';

class OrderViewBodyBlocBuilder extends StatefulWidget {
  const OrderViewBodyBlocBuilder({super.key});

  @override
  State<OrderViewBodyBlocBuilder> createState() =>
      _OrderViewBodyBlocBuilderState();
}

class _OrderViewBodyBlocBuilderState extends State<OrderViewBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return UpdateOrderBlocBuilder(
            child: OrdersViewBody(orders: state.orders),
          );
        } else if (state is FetchOrdersFailure) {
          return CustomErrorWidget(text: state.errorMessage);
        } else {
          return Skeletonizer(child: OrdersViewBody(orders: [getDummyOrder()]));
        }
      },
    );
  }
}
