import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:flutter/material.dart';

import 'orders_line.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        FilterSection(),
        SizedBox(height: 10),
        OrdersLine(),
      ],
    );
  }
}
