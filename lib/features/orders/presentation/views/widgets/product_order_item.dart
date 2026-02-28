import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/cancel_button.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/filter_section_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('أناناس', style: AppStyles.bold19),
                  SizedBox(width: 8),
                  Text(
                    '20 دينار',
                    textAlign: TextAlign.right,
                    style: AppStyles.bold19.copyWith(
                      color: ColorsData.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('29 Nov, 01:20 pm ', style: AppStyles.regular13),
                  Text('2 items', style: AppStyles.regular13),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CancelButton(),
                  FilterSectionItem(
                    textContent: "السائق",
                    textColor: ColorsData.kPrimaryColor,
                    backgroundColor: Colors.transparent,
                    borderColor: ColorsData.kPrimaryColor,
                    height: 26,
                    width: 100,
                    textStyle: AppStyles.semiBold11.copyWith(
                      color: ColorsData.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
