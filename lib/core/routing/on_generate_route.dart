import 'package:ecommerce_app_dashboard/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';

import '../../features/add_product/presentation/views/add_product_view.dart';
import '../../features/products_management/presentation/views/products_management_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case ProductsManagementView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProductsManagementView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
