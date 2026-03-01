import 'package:ecommerce_app_dashboard/core/helper/get_dummy_order.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/orders_item_list_view.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        FilterSection(),
        SizedBox(height: 24),
        Expanded(
          child: OrdersItemListView(
            orders: [getDummyOrder(), getDummyOrder(), getDummyOrder()],
          ),
        ),
      ],
    );
  }
}
