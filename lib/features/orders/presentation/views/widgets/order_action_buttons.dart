import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/manager/cubits/update_orders_cubit/cubit/update_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.accepted,
                orderID: orderEntity.orderID,
              );
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.cancelled,
                orderID: orderEntity.orderID,
              );
            },
            child: const Text('Reject'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.delivered,
                orderID: orderEntity.orderID,
              );
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
