import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/best_seller_header.dart';
import 'package:flutter/material.dart';

class ProductsManagementViewBody extends StatelessWidget {
  const ProductsManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: BestSellerHeader()),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
