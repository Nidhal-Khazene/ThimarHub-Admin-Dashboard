import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_data.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  static final List<String> filterList = ["نشط", "مكتمل", "ملغي"];

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        FilterSection.filterList.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: FilterSectionItem(
            textContent: FilterSection.filterList[index],
            textColor: selectedIndex == index
                ? Colors.white
                : ColorsData.kLightPrimaryColor,
            backgroundColor: selectedIndex == index
                ? ColorsData.kLightPrimaryColor
                : Colors.white,
            borderColor: ColorsData.kLightPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class FilterSectionItem extends StatelessWidget {
  const FilterSectionItem({
    super.key,
    required this.textContent,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  final String textContent;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceInOut,
      width: 110,
      height: 32,
      padding: const EdgeInsets.only(top: 2, left: 12, right: 12, bottom: 2),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(38),
        ),
      ),
      child: Center(
        child: Text(
          textContent,
          style: AppStyles.medium15.copyWith(color: textColor),
        ),
      ),
    );
  }
}
