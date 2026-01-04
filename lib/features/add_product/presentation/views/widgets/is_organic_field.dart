import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_check_box.dart';

class IsOrganicField extends StatefulWidget {
  const IsOrganicField({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicField> createState() => _IsOrganicFieldState();
}

class _IsOrganicFieldState extends State<IsOrganicField> {
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Is product organic?",
                  style: AppStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: kSizedBoxHeight16),
        CustomCheckBox(
          isChecked: isOrganic,
          onChecked: (bool value) {
            isOrganic = value;
            widget.onChanged(isOrganic);
            setState(() {});
          },
        ),
      ],
    );
  }
}
