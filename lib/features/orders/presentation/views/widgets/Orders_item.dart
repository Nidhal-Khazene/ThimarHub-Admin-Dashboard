import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/features/orders/presentation/views/widgets/product_order_item.dart';
import 'package:flutter/material.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsData.kBorderColor, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("المبلغ الاجمالي: ", style: AppStyles.bold16),
              SizedBox(width: 4),
              Text("1000 دج", style: AppStyles.semiBold13),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                "رقم تعريف الزبون: ",
                style: AppStyles.semiBold13.copyWith(
                  color: ColorsData.kFontSecondaryColor,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "1234",
                style: AppStyles.semiBold13.copyWith(
                  color: ColorsData.kFontSecondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text("عنوان الشحن: ", style: AppStyles.bold16),
          SizedBox(height: 4),
          Text("الجزائر ورقلة سيدي خويلد", style: AppStyles.semiBold13),
          SizedBox(height: 16),
          Text("المنتجات:", style: AppStyles.bold16),
          SizedBox(height: 16),
          ProductOrderItem(),
        ],
      ),
    );
  }
}
