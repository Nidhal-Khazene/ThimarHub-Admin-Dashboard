import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../utils/colors_data.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  Widget? leading,
  Color? backgroundColor,
  Color? textColor,
}) {
  return AppBar(
    toolbarHeight: 100,
    leading:
        leading ??
        (Navigator.canPop(context)
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: ColorsData.kLightSecondaryColor,
                  ),
                ),
              )
            : SizedBox()),
    title: Text(title),
    centerTitle: true,
    backgroundColor: backgroundColor ?? ColorsData.kLightPrimaryColor,
    elevation: 0,
    titleTextStyle: AppStyles.bold19.copyWith(
      fontFamily: "Cairo",
      color: textColor ?? Colors.white,
    ),
  );
}
