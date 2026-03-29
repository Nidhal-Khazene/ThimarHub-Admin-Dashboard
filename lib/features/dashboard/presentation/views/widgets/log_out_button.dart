import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/colors_data.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 41,
        decoration: const ShapeDecoration(
          color: Color(0xFFEBF9F1),
          shape: RoundedRectangleBorder(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text(
                'تسجيل الخروج',
                textAlign: TextAlign.center,
                style: AppStyles.semiBold13.copyWith(
                  color: const Color(0xFF1B5E37) /* Green1-500 */,
                ),
              ),
              Icon(Iconsax.logout_copy, color: ColorsData.kPrimaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
