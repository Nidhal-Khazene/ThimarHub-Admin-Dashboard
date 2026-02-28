import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../utils/colors_data.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  Widget? leading,
}) {
  return AppBar(
    leading:
        leading ??
        (Navigator.canPop(context)
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.arrow_back_ios, size: 20),
                ),
              )
            : SizedBox()),
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: AppStyles.bold19.copyWith(
      fontFamily: "Cairo",
      color: ColorsData.kFontPrimaryColor,
    ),
  );
}
