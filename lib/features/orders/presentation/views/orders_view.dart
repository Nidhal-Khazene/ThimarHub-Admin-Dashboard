import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        textColor: Colors.white,
        title: "الطلبات",
        backgroundColor: ColorsData.kLightPrimaryColor,
        context: context,
      ),
      body: SafeArea(
        child: Padding(padding: kPrimaryScreenPadding, child: OrdersViewBody()),
      ),
    );
  }
}
