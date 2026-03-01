import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/cancel_button.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/filter_section_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/order_model.dart';
import '../../../data/models/product_order_model.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({
    super.key,
    required this.orderProductsModel,
    required this.orderModel,
  });

  final OrderProductsModel orderProductsModel;
  final OrderModel orderModel;

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
              image: AssetImage(orderProductsModel.imageUrl),
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
                  Text(orderProductsModel.productName, style: AppStyles.bold19),
                  SizedBox(width: 8),
                  Text(
                    '${orderProductsModel.productPrice} دينار',
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
                  Text('${orderModel.date} ', style: AppStyles.regular13),
                  Text(
                    '${orderProductsModel.quantity} عناصر',
                    style: AppStyles.regular13.copyWith(
                      color: ColorsData.kSecondaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
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
