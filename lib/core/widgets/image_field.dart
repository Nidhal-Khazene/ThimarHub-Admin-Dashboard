import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:flutter/material.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: ColorsData.kBorderColor),
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.image_rounded,
              size: 180,
              color: const Color(0xFFC9CECE),
            ),
            Text(
              "Product Image",
              style: AppStyles.regular16.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
