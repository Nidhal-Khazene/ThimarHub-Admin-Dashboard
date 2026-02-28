import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/cancel_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(Assets.imagesProductsAnanas),
            ),
          ),
        ),
        SizedBox(width: 16),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('أناناس', style: AppStyles.bold16),
                SizedBox(height: 9),
                Text('29 Nov, 01:20 pm ', style: AppStyles.regular13),
                SizedBox(height: 5),
                CancelButton(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
