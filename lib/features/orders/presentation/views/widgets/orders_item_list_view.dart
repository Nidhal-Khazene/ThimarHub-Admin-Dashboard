import 'package:flutter/material.dart';

import '../../../data/models/order_model.dart';
import 'Orders_item.dart';

class OrdersItemListView extends StatelessWidget {
  const OrdersItemListView({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: OrdersItem(orderModel: orders[index]),
      ),
    );
  }
}
