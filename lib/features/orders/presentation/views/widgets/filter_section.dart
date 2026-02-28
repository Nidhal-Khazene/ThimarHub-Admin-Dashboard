import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_data.dart';
import 'filter_section_item.dart';

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
