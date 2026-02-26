import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/colors_data.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("الأكثر مبيعًا", style: AppStyles.bold16),
        Text(
          "المزيد",
          style: AppStyles.regular13.copyWith(
            color: ColorsData.kFontSecondaryColor,
          ),
        ),
      ],
    );
  }
}
