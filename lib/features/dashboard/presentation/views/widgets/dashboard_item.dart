import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    super.key,
    required this.textContent,
    required this.iconImage,
  });

  final String textContent;
  final String iconImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 66,
          height: 66,
          padding: EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: const Color(0xFFEBF9F1),
            shape: OvalBorder(),
          ),
          child: SvgPicture.asset(iconImage),
        ),
        SizedBox(width: 24),
        Text(textContent, style: AppStyles.bold13),
      ],
    );
  }
}
