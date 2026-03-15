import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../add_product/domain/entities/product_entity.dart';

class EditImageSection extends StatelessWidget {
  const EditImageSection({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text('رفع صورة المنتج', style: AppStyles.bold13),
              ),
              SizedBox(height: 16),
              CustomButton(
                backgroundColor: ColorsData.kPrimaryColor,
                text: 'اضف صورة',
                textStyle: AppStyles.bold13.copyWith(color: Colors.white),
                height: 44,
                width: 156,
              ),
            ],
          ),
        ),
        Image.network(productEntity.urlImage!, width: 124, height: 124),
      ],
    );
  }
}
