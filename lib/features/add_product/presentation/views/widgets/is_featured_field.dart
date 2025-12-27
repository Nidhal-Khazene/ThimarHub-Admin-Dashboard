import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_check_box.dart';

class IsFeaturedField extends StatefulWidget {
  const IsFeaturedField({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedField> createState() => _IsFeaturedFieldState();
}

class _IsFeaturedFieldState extends State<IsFeaturedField> {
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isFeatured,
          onChecked: (bool value) {
            isFeatured = value;
            widget.onChanged(isFeatured);
            setState(() {});
          },
        ),
        const SizedBox(width: kSizedBoxHeight16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Is the item featured?",
                  style: AppStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
